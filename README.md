# tools.sh — Installed Tools Inspector

A simple terminal script for **macOS** that shows all your installed tools, package managers and libraries, organized by category with version numbers.

> ⚠️ **macOS only.** This script uses macOS-specific commands and is not compatible with Linux or Windows.

Available in **English**, **Català** and **Español** — chosen interactively each time you run it.

---

## What it shows

- **System** — macOS version, architecture, free disk space
- **Basic tools** — git, curl, wget, VS Code, ssh
- **Homebrew** — what you installed on request (dependencies are just counted) and apps (casks)
- **Python** — every interpreter on the machine (macOS, Homebrew, uv, pyenv, python.org, conda), pip packages and packages installed with `pip install --user`
- **Virtual environments** — every Python environment in your home folder, sorted by size, flagging heavy libraries (torch, tensorflow, mlx, transformers…) and warning when several environments carry their own copy
- **uv / uvx** — version and installed tools
- **Node.js / npm** — node, npm, npx, pnpm, yarn, global packages, and how much your projects' `node_modules` folders take up
- **Ruby** — ruby, gem and installed gems (the system Ruby's bundled gems are only counted)
- **AI tools (CLI)** — Claude Code, Codex, Gemini CLI, Ollama, aider, llm, fabric...
- **AI models** — Ollama, Hugging Face, Whisper and LM Studio models stored locally, with sizes
- **Caches** — uv, npm, pip, Homebrew, Yarn, pnpm, Go, Cargo… with their size and the command that cleans each one
- **Other** — docker, ffmpeg, jq, make, rust, go, java

The script **only reads**: it never installs, deletes or cleans anything. Cleaning commands are shown so you can decide.

### Why it shows sizes

Coding assistants and tutorials often install things for each project: a new virtual environment here, a model download there. After a while the same heavy library (PyTorch is about 0.5 GB per copy) may live in several environments, and caches may take many gigabytes. The environments, models and caches sections are there to make that visible.

Searching your home folder takes a few seconds (around 20–30 s on a busy machine).

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

   ▌ VIRTUAL ENVIRONMENTS (Python)
   ────────────────────────────────────────
     •   1.3G  py3.12  ~/projects/audio/.venv torch
     •   0.9G  py3.12  ~/projects/tts/.venv torch transformers
     •   410M  py3.11  ~/experiments/pitch/.venv
   ⚠  2 environments include torch (each with its own copy)

   ▌ AI MODELS (local)
   ────────────────────────────────────────
   ✓ Ollama               9.6G  (~/.ollama/models)
     •  9.6GB  gemma4:latest

   ▌ CACHES (safe to clean)
   ────────────────────────────────────────
   ✓ uv                    4.2G  uv cache prune
   ✓ npm                   1.1G  npm cache clean --force
   ...
```

---

## Author

**José Luis Miralles Bono** · [jlmirall.es](https://jlmirall.es) · joseluismirallesbono@gmail.com ·
☕ [Buy me a horchata](https://ko-fi.com/miralles)

More info (in Spanish): [¿Qué tengo instalado en este cacharro?](https://elpulpoenelvaso.jlmirall.es/?p=616)

## License

© 2026 José Luis Miralles Bono

- **Code** (`tools.sh`): [GNU AGPL v3](LICENSE) — use it, share it, adapt it; if you publish a modified
  version, keep the same license and share its source.
- **Documentation:** [CC BY-SA 4.0](LICENSE-CONTENIDOS).

Versions published before 7 November 2026 were released under the MIT license and keep it.
