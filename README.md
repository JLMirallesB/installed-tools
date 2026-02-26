# tools.sh — Installed Tools Inspector

A simple terminal script for **macOS** that shows all your installed tools, package managers and libraries, organized by category with version numbers.

> ⚠️ **macOS only.** This script uses macOS-specific commands and is not compatible with Linux or Windows.

Available in **English**, **Català** and **Español** — chosen interactively each time you run it.

---

## What it shows

- **System** — macOS version, architecture
- **Basic tools** — git, curl, wget, VS Code, ssh
- **Homebrew** — all installed packages with versions
- **Python** — python3, pip3 and all installed packages
- **uv / uvx** — version and installed tools
- **Node.js / npm** — node, npm, npx, pnpm, yarn and global packages
- **Ruby** — ruby, gem and installed gems
- **AI tools (CLI)** — Claude Code, Codex, Gemini CLI, Ollama, aider, llm, fabric...
- **Other** — docker, ffmpeg, jq, make, rust, go, java

---

## Installation

Open **Terminal** (Applications → Utilities → Terminal) and run these three lines, one at a time:

```bash
curl -O https://raw.githubusercontent.com/JLMirallesB/installed-tools/main/tools.sh
chmod +x tools.sh
bash tools.sh
```

The first line downloads the script, the second gives it permission to run, and the third launches it.

Or clone the repo:

```bash
git clone https://github.com/JLMirallesB/installed-tools
cd installed-tools
chmod +x tools.sh
bash tools.sh
```

### Optional: add a global alias

Run this once in Terminal to make `herramientas` (or any word you like) available from anywhere:

```bash
echo "alias herramientas='bash ~/tools.sh'" >> ~/.zshrc && source ~/.zshrc
```

From then on, just type `herramientas` and press Enter — no matter which folder you're in.

---

## Usage

When you run the script, a language menu appears first:

```
   ┌─────────────────────────────────┐
   │   1  ›  English                 │
   │   2  ›  Català                  │
   │   3  ›  Español                 │
   └─────────────────────────────────┘

   ›  _
```

Type 1, 2 or 3 and press Enter. That's it.

### Skip the menu (useful for saving to a file)

```bash
bash tools.sh --lang en > my-tools.txt
bash tools.sh --lang ca > my-tools.txt
bash tools.sh --lang es > my-tools.txt
```

---

## Requirements

- **macOS** — Intel or Apple Silicon (M1/M2/M3/M4/M5)
- **bash** — pre-installed on macOS, no additional dependencies needed

The script gracefully skips any tool that is not installed — no errors, no crashes.

---

## Screenshot

```
   ╔═══════════════════════════════════════════╗
   ║                                           ║
   ║    ▸▸  INSTALLED TOOLS INSPECTOR  ◂◂     ║
   ║                                           ║
   ╚═══════════════════════════════════════════╝

   ╔═══════════════════════════════════════════╗
   ║  INSTALLED TOOLS                          ║
   ║  26/02/2026 · 12:00  ·  macOS 26.3       ║
   ╚═══════════════════════════════════════════╝

   ▌ SYSTEM
   ────────────────────────────────────────
   ✓ macOS               26.3  (arm64)
   ✓ Xcode CLT           installed

   ▌ AI TOOLS (CLI)
   ────────────────────────────────────────
   ✓ Claude Code         2.1.42
   ✓ Codex               codex-cli 0.101.0
   ✗ Gemini CLI          not installed
   ...
```

---

## License

MIT — use it, share it, adapt it.
