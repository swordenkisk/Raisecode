# 📱 RiseCode
### Claude Code on Android — Lightweight, Fast, No Local AI Models Required

<div align="center">

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Platform](https://img.shields.io/badge/platform-Android-green)
![Size](https://img.shields.io/badge/size-~230MB-orange)
![License](https://img.shields.io/badge/license-MIT-purple)
![Author](https://img.shields.io/badge/author-swordenkisk-black)

</div>

---

## 🧠 The Idea

Most AI-on-mobile solutions require downloading massive models (10–70GB) that drain your RAM and storage.

**In3Pro takes a smarter approach:**

```
Your Phone  →  Lightweight Client (~230MB)  →  Anthropic API  →  Claude
```

Your phone acts as an **intelligent terminal** that connects directly to Anthropic's servers.
No local models. No RAM overload. Full Claude power — in your pocket.

---

## ✨ Features

- ⚡ **One-command install** — fully automated setup via Termux
- 🌐 **Direct API connection** — always using the latest Claude models
- 🖥️ **Server mode** — expose Claude Code as a local HTTP server on your WiFi
- 📁 **Project manager** — create and navigate projects instantly
- 🐚 **Pre-configured shell** — Zsh + Oh My Zsh ready out of the box
- 💾 **Only ~230MB** — fits comfortably on low-storage devices
- 🔒 **Your data, your key** — uses your own Anthropic API Key

---

## 📋 Requirements

| Requirement | Details |
|------------|---------|
| Device | Android 5.0+ |
| App | Termux (from F-Droid) |
| Storage | ~230MB free |
| Internet | Wi-Fi or Mobile Data |
| API Key | Anthropic API Key |

---

## 🚀 Quick Install

### Step 1 — Install Termux
> ⚠️ Download from **F-Droid only** — the Play Store version is outdated.

🔗 https://f-droid.org/packages/com.termux/

### Step 2 — Run Bootstrap
Open Termux and paste this command:

```bash
curl -sL https://raw.githubusercontent.com/swordenkisk/Raisecode/main/termux/bootstrap.sh | bash
```

### Step 3 — Set Your API Key
```bash
export ANTHROPIC_API_KEY="sk-ant-your-key-here"
echo "export ANTHROPIC_API_KEY='sk-ant-your-key-here'" >> ~/.zshrc
```

> Get your API key at: https://console.anthropic.com

### Step 4 — Start Coding! 🎉
```bash
claude "Help me build a Python script"
```

---

## 📂 Project Structure

```
In3Pro/
├── 📄 README.md
├── 📄 LICENSE
├── 📁 termux/
│   └── bootstrap.sh          # Automated one-command installer
├── 📁 scripts/
│   ├── server.sh             # Local HTTP server mode
│   └── new_project.sh        # Quick project scaffolding
├── 📁 config/
│   └── .Raisecode.yml           # Default configuration
└── 📁 docs/
    └── SETUP.md              # Full setup guide
```

---

## 🛠️ Available Commands

| Command | Description |
|---------|-------------|
| `claude "question"` | Ask Claude directly |
| `claude .` | Open Claude Code in current directory |
| `newproject` | Scaffold a new project interactively |
| `bash server.sh` | Start local server mode |
| `projects` | Navigate to your projects folder |

---

## 🌐 Server Mode

Run In3Pro as a **local HTTP server** accessible from any device on your network:

```bash
bash ~/Risecode/scripts/server.sh
```

Then from any device on the same Wi-Fi:

```bash
# Health check
curl http://YOUR_PHONE_IP:8765/health

# Ask Claude
curl -X POST http://YOUR_PHONE_IP:8765/ask \
  -H "Content-Type: application/json" \
  -d '{"prompt": "Hello Claude!"}'
```

---

## 📦 What Gets Installed

| Component | Size |
|-----------|------|
| Termux base | ~80 MB |
| Node.js | ~55 MB |
| Claude Code CLI | ~35 MB |
| Git + tools | ~45 MB |
| Python (server) | ~15 MB |
| **Total** | **~230 MB** ✅ |

---

## 🔧 Troubleshooting

**`claude: command not found`**
```bash
npm install -g @anthropic-ai/claude-code
```

**API Key error**
```bash
export ANTHROPIC_API_KEY="your-key-here"
```

**Slow connection**
- Switch to a stable Wi-Fi network
- Check your Anthropic API usage limits at console.anthropic.com

**Storage permission denied**
```bash
termux-setup-storage
```

---

## 🗺️ Roadmap

- [ ] v1.1 — Offline mode with lightweight local fallback
- [ ] v1.2 — In3Pro GUI app (Android native wrapper)
- [ ] v1.3 — Multi-device sync via server mode
- [ ] v2.0 — Full NetHunter-style environment bundle

---

## 🤝 Contributing

Contributions are welcome from everyone!

1. Fork the repository
2. Create your branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m "Add: your feature"`
4. Push to the branch: `git push origin feature/your-feature`
5. Open a Pull Request

---

## 📄 License

MIT License — Copyright (c) 2026 [swordenkisk](https://github.com/swordenkisk)

See [LICENSE](./LICENSE) for full details.

---

## 👤 Author

**swordenkisk**
> Inventor | AI Researcher | Software Architect

🔗 GitHub: https://github.com/swordenkisk

---

<div align="center">

**"The power of Claude. The freedom of mobile."** 📱

⭐ Star this repo if you find it useful!

</div>
