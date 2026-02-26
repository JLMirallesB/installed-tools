# tools.sh — Installed Tools Inspector

A simple terminal script for macOS that shows all your installed tools, package managers and libraries, organized by category with version numbers.

Available in **English**, **Català** and **Español**.

---

## What it shows

- **System** — macOS version, architecture
- **Basic tools** — git, curl, wget, VS Code, ssh
- **Homebrew** — all installed packages with versions
- **Python** — python3, pip3 and all installed packages
- **uv / uvx** — version and installed tools
- **Node.js / npm** — node, npm, npx, pnpm, yarn and global packages
- **Ruby** — ruby, gem and installed gems
- **Other** — docker, ffmpeg, jq, make, rust, go, java

---

## Installation

```bash
curl -O https://raw.githubusercontent.com/YOUR_USERNAME/tools.sh/main/tools.sh
chmod +x tools.sh
```

Or clone the repo:

```bash
git clone https://github.com/YOUR_USERNAME/tools.sh
cd tools.sh
chmod +x tools.sh
```

### Optional: add a global alias

Add this line to your `~/.zshrc` or `~/.bashrc`:

```bash
alias tools='bash ~/tools.sh'
```

Then reload your shell:

```bash
source ~/.zshrc
```

---

## Usage

```bash
# English (default)
bash tools.sh

# Català
bash tools.sh --lang ca

# Español
bash tools.sh --lang es

# Save output to a file
bash tools.sh > my-tools.txt
```

---

## Requirements

- macOS (tested on Apple Silicon — M1/M2/M3/M4/M5)
- bash (pre-installed on macOS)

The script gracefully skips any tool that is not installed — no errors, no crashes.

---

## Screenshot

```
┌─────────────────────────────────────────┐
│  INSTALLED TOOLS                        │
│  26/02/2026  12:00                      │
└─────────────────────────────────────────┘

▶ SYSTEM
  ────────────────────────────────────────
  ✓ macOS               15.3  (arm64)
  ✓ Xcode CLT           installed

▶ HOMEBREW (brew)
  ────────────────────────────────────────
  ✓ brew                5.0.15
  ...
```

---

## License

MIT — use it, share it, adapt it.
