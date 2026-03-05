#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
#   Claude Mobile Server Mode
#   تشغيل Claude Code كـ API server خفيف على الهاتف
# ============================================================

GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

PORT=${1:-8765}

echo -e "${CYAN}🚀 Claude Mobile Server Mode${NC}"
echo -e "${YELLOW}Port: $PORT${NC}\n"

# Check if Claude Code is installed
if ! command -v claude &> /dev/null; then
    echo -e "${RED}❌ Claude Code not found. Run bootstrap.sh first!${NC}"
    exit 1
fi

# Check API key
if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo -e "${YELLOW}⚠️  API Key not set.${NC}"
    echo -n "Enter your Anthropic API Key: "
    read -s API_KEY
    export ANTHROPIC_API_KEY=$API_KEY
    
    # Save to .zshrc for future sessions
    echo "export ANTHROPIC_API_KEY='$API_KEY'" >> ~/.zshrc
    echo -e "\n${GREEN}✓ API Key saved${NC}"
fi

# Display local IP for connecting from other devices
LOCAL_IP=$(ip route get 1 | awk '{print $7; exit}' 2>/dev/null || hostname -I | awk '{print $1}')
echo -e "${GREEN}📡 Your local IP: ${CYAN}$LOCAL_IP${NC}"
echo -e "${GREEN}🔗 Connect from any device on same WiFi: ${CYAN}http://$LOCAL_IP:$PORT${NC}\n"

# Start Claude Code in server/API mode
echo -e "${GREEN}✅ Claude Mobile Server running...${NC}"
echo -e "${YELLOW}Press Ctrl+C to stop${NC}\n"

# Launch claude with MCP server capabilities
claude --mcp-server &
CLAUDE_PID=$!

# Simple HTTP bridge using Python (lightweight)
python3 - << PYEOF
import http.server
import json
import subprocess
import os

class ClaudeHandler(http.server.BaseHTTPRequestHandler):
    def log_message(self, format, *args):
        pass  # Suppress logs for cleaner output
    
    def do_GET(self):
        if self.path == '/health':
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.end_headers()
            self.wfile.write(json.dumps({"status": "ok", "service": "claude-mobile"}).encode())
        elif self.path == '/':
            self.send_response(200)
            self.send_header('Content-Type', 'text/html')
            self.end_headers()
            html = """
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title>Claude Mobile Server</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body { font-family: Arial; background: #0d1117; color: #c9d1d9; padding: 20px; }
        h1 { color: #58a6ff; }
        .status { background: #161b22; padding: 15px; border-radius: 8px; border: 1px solid #30363d; }
        .online { color: #3fb950; }
    </style>
</head>
<body>
    <h1>📱 Claude Mobile Server</h1>
    <div class="status">
        <p>Status: <span class="online">● Online</span></p>
        <p>API: Connected to Anthropic</p>
    </div>
</body>
</html>"""
            self.wfile.write(html.encode())

    def do_POST(self):
        if self.path == '/ask':
            content_length = int(self.headers['Content-Length'])
            post_data = json.loads(self.rfile.read(content_length))
            prompt = post_data.get('prompt', '')
            
            result = subprocess.run(
                ['claude', '-p', prompt],
                capture_output=True, text=True, timeout=60
            )
            
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.send_header('Access-Control-Allow-Origin', '*')
            self.end_headers()
            response = {"response": result.stdout, "error": result.stderr}
            self.wfile.write(json.dumps(response).encode())

server = http.server.HTTPServer(('0.0.0.0', $PORT), ClaudeHandler)
print(f"\033[0;32m✅ Server listening on port $PORT\033[0m")
server.serve_forever()
PYEOF
