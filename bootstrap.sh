#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
#   Claude Mobile - Bootstrap Script
#   نظام Claude Code على الهاتف عبر Termux
#   Version: 1.0.0
# ============================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

BANNER="
${CYAN}
  ██████╗██╗      █████╗ ██╗   ██╗██████╗ ███████╗
 ██╔════╝██║     ██╔══██╗██║   ██║██╔══██╗██╔════╝
 ██║     ██║     ███████║██║   ██║██║  ██║█████╗  
 ██║     ██║     ██╔══██║██║   ██║██║  ██║██╔══╝  
 ╚██████╗███████╗██║  ██║╚██████╔╝██████╔╝███████╗
  ╚═════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝
         📱 MOBILE - Claude Code on Android
${NC}"

echo -e "$BANNER"
echo -e "${YELLOW}⚡ Starting installation...${NC}\n"

# --- Step 1: Update packages ---
echo -e "${BLUE}[1/6] Updating Termux packages...${NC}"
pkg update -y && pkg upgrade -y
echo -e "${GREEN}✓ Packages updated${NC}\n"

# --- Step 2: Install dependencies ---
echo -e "${BLUE}[2/6] Installing core dependencies...${NC}"
pkg install -y \
    nodejs \
    git \
    curl \
    wget \
    openssh \
    python \
    vim \
    nano \
    zsh \
    unzip
echo -e "${GREEN}✓ Dependencies installed${NC}\n"

# --- Step 3: Install Claude Code ---
echo -e "${BLUE}[3/6] Installing Claude Code CLI...${NC}"
npm install -g @anthropic-ai/claude-code
echo -e "${GREEN}✓ Claude Code installed${NC}\n"

# --- Step 4: Setup storage access ---
echo -e "${BLUE}[4/6] Setting up storage access...${NC}"
termux-setup-storage
echo -e "${GREEN}✓ Storage access configured${NC}\n"

# --- Step 5: Configure shell (zsh) ---
echo -e "${BLUE}[5/6] Configuring shell...${NC}"
# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Add aliases
cat >> ~/.zshrc << 'EOF'

# === Claude Mobile Aliases ===
alias claude="claude"
alias cc="claude code"
alias projects="cd ~/storage/shared/ClaudeProjects"
alias newproject="bash ~/claude-mobile/scripts/new_project.sh"

# Claude Code shortcuts
export EDITOR=nano
EOF

echo -e "${GREEN}✓ Shell configured${NC}\n"

# --- Step 6: Create projects directory ---
echo -e "${BLUE}[6/6] Creating projects directory...${NC}"
mkdir -p ~/storage/shared/ClaudeProjects
echo -e "${GREEN}✓ Projects directory created at ~/storage/shared/ClaudeProjects${NC}\n"

# --- Done! ---
echo -e "${GREEN}
╔══════════════════════════════════════════╗
║     ✅ Installation Complete!            ║
║                                          ║
║  Next steps:                             ║
║  1. Run: claude config                   ║
║  2. Enter your Anthropic API Key         ║
║  3. Run: claude --help                   ║
║                                          ║
║  Happy coding! 🚀                        ║
╚══════════════════════════════════════════╝
${NC}"
