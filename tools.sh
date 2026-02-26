#!/bin/bash

# ================================================
#   INSTALLED TOOLS INSPECTOR
#   github.com/JLMirallesB/installed-tools
# ================================================

# ── COLORS ────────────────────────────────────
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
GRAY='\033[0;37m'
NC='\033[0m'

# ── CHECK FOR --lang FLAG (skips menu) ────────
IDIOMA=""
while [[ $# -gt 0 ]]; do
    case "$1" in
        --lang) IDIOMA="$2"; shift 2 ;;
        --lang=*) IDIOMA="${1#*=}"; shift ;;
        *) shift ;;
    esac
done

# ── INTRO BANNER ──────────────────────────────
clear
echo ""
echo -e "${BOLD}${CYAN}   ╔═══════════════════════════════════════════╗${NC}"
echo -e "${BOLD}${CYAN}   ║                                           ║${NC}"
echo -e "${BOLD}${CYAN}   ║    ▸▸  INSTALLED TOOLS INSPECTOR  ◂◂     ║${NC}"
echo -e "${BOLD}${CYAN}   ║                                           ║${NC}"
echo -e "${BOLD}${CYAN}   ╚═══════════════════════════════════════════╝${NC}"
echo ""

# ── LANGUAGE MENU ─────────────────────────────
if [[ -z "$IDIOMA" ]]; then
    echo -e "   ${BOLD}🌐  Select language / Tria l'idioma / Elige idioma${NC}"
    echo ""
    echo -e "   ${CYAN}┌─────────────────────────────────┐${NC}"
    echo -e "   ${CYAN}│${NC}   ${BOLD}1${NC}  ›  English                ${CYAN}│${NC}"
    echo -e "   ${CYAN}│${NC}   ${BOLD}2${NC}  ›  Català                 ${CYAN}│${NC}"
    echo -e "   ${CYAN}│${NC}   ${BOLD}3${NC}  ›  Español                ${CYAN}│${NC}"
    echo -e "   ${CYAN}└─────────────────────────────────┘${NC}"
    echo ""
    printf "   ${BOLD}›${NC}  "
    read -r CHOICE
    case "$CHOICE" in
        2) IDIOMA="ca" ;;
        3) IDIOMA="es" ;;
        *) IDIOMA="en" ;;
    esac
    clear
    echo ""
    echo -e "${BOLD}${CYAN}   ╔═══════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${CYAN}   ║                                           ║${NC}"
    echo -e "${BOLD}${CYAN}   ║    ▸▸  INSTALLED TOOLS INSPECTOR  ◂◂     ║${NC}"
    echo -e "${BOLD}${CYAN}   ║                                           ║${NC}"
    echo -e "${BOLD}${CYAN}   ╚═══════════════════════════════════════════╝${NC}"
    echo ""
fi

# ── LANGUAGE STRINGS ──────────────────────────
case "$IDIOMA" in
    ca)
        T_TITLE="EINES INSTAL·LADES"
        T_SYSTEM="SISTEMA"
        T_BASIC="EINES BÀSIQUES"
        T_HOMEBREW="HOMEBREW (brew)"
        T_BREW_PKGS="Paquets instal·lats:"
        T_PYTHON="PYTHON"
        T_PIP_PKGS="Paquets pip instal·lats:"
        T_UV="UV / UVX"
        T_UV_TOOLS="Eines instal·lades amb uv tool / uvx:"
        T_UV_INCL="inclòs en uv"
        T_NODE="NODE.JS / NPM"
        T_NPM_PKGS="Paquets npm globals:"
        T_RUBY="RUBY"
        T_GEM_PKGS="Gems instal·lades:"
        T_AI="EINES D'IA (CLI)"
        T_OTHERS="ALTRES"
        T_NOT_INST="no instal·lat"
        T_SAVE="Per desar el llistat en un fitxer:"
        ;;
    es)
        T_TITLE="HERRAMIENTAS INSTALADAS"
        T_SYSTEM="SISTEMA"
        T_BASIC="HERRAMIENTAS BÁSICAS"
        T_HOMEBREW="HOMEBREW (brew)"
        T_BREW_PKGS="Paquetes instalados:"
        T_PYTHON="PYTHON"
        T_PIP_PKGS="Paquetes pip instalados:"
        T_UV="UV / UVX"
        T_UV_TOOLS="Herramientas instaladas con uv tool / uvx:"
        T_UV_INCL="incluido en uv"
        T_NODE="NODE.JS / NPM"
        T_NPM_PKGS="Paquetes npm globales:"
        T_RUBY="RUBY"
        T_GEM_PKGS="Gems instaladas:"
        T_AI="HERRAMIENTAS DE IA (CLI)"
        T_OTHERS="OTROS"
        T_NOT_INST="no instalado"
        T_SAVE="Para guardar el listado en un archivo:"
        ;;
    *)  # en (default)
        T_TITLE="INSTALLED TOOLS"
        T_SYSTEM="SYSTEM"
        T_BASIC="BASIC TOOLS"
        T_HOMEBREW="HOMEBREW (brew)"
        T_BREW_PKGS="Installed packages:"
        T_PYTHON="PYTHON"
        T_PIP_PKGS="Installed pip packages:"
        T_UV="UV / UVX"
        T_UV_TOOLS="Tools installed with uv tool / uvx:"
        T_UV_INCL="included in uv"
        T_NODE="NODE.JS / NPM"
        T_NPM_PKGS="Global npm packages:"
        T_RUBY="RUBY"
        T_GEM_PKGS="Installed gems:"
        T_AI="AI TOOLS (CLI)"
        T_OTHERS="OTHER"
        T_NOT_INST="not installed"
        T_SAVE="To save the list to a file:"
        ;;
esac

# ── FUNCTIONS ─────────────────────────────────
seccion() {
    echo ""
    echo -e "   ${BOLD}${CYAN}▌${NC} ${BOLD}$1${NC}"
    echo -e "   ${GRAY}────────────────────────────────────────${NC}"
}

ok() {
    printf "   ${GREEN}✓${NC} ${BOLD}%-20s${NC} %s\n" "$1" "$2"
}

no() {
    printf "   ${RED}✗${NC} ${GRAY}%-20s %s${NC}\n" "$1" "$T_NOT_INST"
}

cmd_existe() {
    command -v "$1" &> /dev/null
}

# ── MAIN HEADER ───────────────────────────────
MACOS_VER="$(sw_vers -productVersion)"
ARCH="$(uname -m)"
DATE_STR="$(date '+%d/%m/%Y · %H:%M')"

echo -e "   ${BOLD}${CYAN}╔═══════════════════════════════════════════╗${NC}"
printf "   ${BOLD}${CYAN}║${NC}  ${BOLD}%-41s${BOLD}${CYAN}║${NC}\n" "$T_TITLE"
printf "   ${BOLD}${CYAN}║${NC}  ${GRAY}%-41s${BOLD}${CYAN}║${NC}\n" "$DATE_STR  ·  macOS $MACOS_VER"
echo -e "   ${BOLD}${CYAN}╚═══════════════════════════════════════════╝${NC}"

# ── SYSTEM ────────────────────────────────────
seccion "$T_SYSTEM"
ok "macOS" "$MACOS_VER  ($ARCH)"
ok "Xcode CLT" "$(xcode-select -p 2>/dev/null | grep -q CommandLine && echo 'installed' || echo "$T_NOT_INST")"

# ── BASIC TOOLS ───────────────────────────────
seccion "$T_BASIC"
cmd_existe git  && ok "git"     "$(git --version | awk '{print $3}')"              || no "git"
cmd_existe curl && ok "curl"    "$(curl --version | head -1 | awk '{print $2}')"   || no "curl"
cmd_existe wget && ok "wget"    "$(wget --version 2>&1 | head -1 | awk '{print $3}')" || no "wget"
cmd_existe code && ok "VS Code" "$(code --version 2>/dev/null | head -1)"          || no "VS Code"
cmd_existe ssh  && ok "ssh"     "$(ssh -V 2>&1 | awk '{print $1}')"                || no "ssh"

# ── HOMEBREW ──────────────────────────────────
seccion "$T_HOMEBREW"
if cmd_existe brew; then
    ok "brew" "$(brew --version | head -1 | awk '{print $2}')"
    echo ""
    echo -e "   ${YELLOW}${T_BREW_PKGS}${NC}"
    brew list --versions 2>/dev/null | sort | while IFS= read -r line; do
        printf "     ${GRAY}•${NC} %s\n" "$line"
    done
else
    no "brew"
fi

# ── PYTHON ────────────────────────────────────
seccion "$T_PYTHON"
if cmd_existe python3; then
    ok "python3" "$(python3 --version 2>&1 | awk '{print $2}')"
    if cmd_existe pip3; then
        ok "pip3" "$(pip3 --version 2>&1 | awk '{print $2}')"
        echo ""
        echo -e "   ${YELLOW}${T_PIP_PKGS}${NC}"
        pip3 list 2>/dev/null | tail -n +3 | while IFS= read -r line; do
            printf "     ${GRAY}•${NC} %s\n" "$line"
        done
    else
        no "pip3"
    fi
else
    no "python3"
fi

# ── UV / UVX ──────────────────────────────────
seccion "$T_UV"
if cmd_existe uv; then
    ok "uv"  "$(uv --version 2>&1 | awk '{print $2}')"
    ok "uvx" "$T_UV_INCL"
    echo ""
    echo -e "   ${YELLOW}${T_UV_TOOLS}${NC}"
    uv tool list 2>/dev/null | while IFS= read -r line; do
        printf "     ${GRAY}•${NC} %s\n" "$line"
    done
else
    no "uv / uvx"
fi

# ── NODE.JS / NPM ─────────────────────────────
seccion "$T_NODE"
if cmd_existe node; then
    ok "node" "$(node --version)"
    cmd_existe npm  && ok "npm"  "$(npm --version)"  || no "npm"
    cmd_existe npx  && ok "npx"  "$(npx --version)"  || no "npx"
    cmd_existe pnpm && ok "pnpm" "$(pnpm --version)" || no "pnpm"
    cmd_existe yarn && ok "yarn" "$(yarn --version)" || no "yarn"
    echo ""
    echo -e "   ${YELLOW}${T_NPM_PKGS}${NC}"
    npm list -g --depth=0 2>/dev/null | tail -n +2 | while IFS= read -r line; do
        printf "     ${GRAY}•${NC} %s\n" "$line"
    done
else
    no "node"
fi

# ── RUBY ──────────────────────────────────────
seccion "$T_RUBY"
cmd_existe ruby && ok "ruby" "$(ruby --version | awk '{print $2}')" || no "ruby"
cmd_existe gem  && ok "gem"  "$(gem --version)"                     || no "gem"
if cmd_existe gem; then
    echo ""
    echo -e "   ${YELLOW}${T_GEM_PKGS}${NC}"
    gem list 2>/dev/null | while IFS= read -r line; do
        printf "     ${GRAY}•${NC} %s\n" "$line"
    done
fi

# ── AI TOOLS (CLI) ────────────────────────────
seccion "$T_AI"
cmd_existe claude && ok "Claude Code" "$(claude --version 2>&1 | head -1)"  || no "Claude Code"
cmd_existe codex  && ok "Codex"       "$(codex --version 2>&1 | head -1)"   || no "Codex"
cmd_existe gemini && ok "Gemini CLI"  "$(gemini --version 2>&1 | head -1)"  || no "Gemini CLI"
cmd_existe aider  && ok "aider"       "$(aider --version 2>&1 | head -1)"   || no "aider"
cmd_existe ollama && ok "Ollama"      "$(ollama --version 2>&1 | head -1)"  || no "Ollama"
cmd_existe sgpt   && ok "sgpt"        "$(sgpt --version 2>&1 | head -1)"    || no "sgpt"
cmd_existe llm    && ok "llm"         "$(llm --version 2>&1 | head -1)"     || no "llm"
cmd_existe fabric && ok "fabric"      "$(fabric --version 2>&1 | head -1)"  || no "fabric"

# ── OTHER ─────────────────────────────────────
seccion "$T_OTHERS"
cmd_existe docker         && ok "docker"      "$(docker --version | awk '{print $3}' | tr -d ',')"         || no "docker"
cmd_existe docker-compose && ok "docker-comp" "$(docker-compose --version | awk '{print $4}' | tr -d ',')" || no "docker-compose"
cmd_existe ffmpeg         && ok "ffmpeg"      "$(ffmpeg -version 2>&1 | head -1 | awk '{print $3}')"       || no "ffmpeg"
cmd_existe jq             && ok "jq"          "$(jq --version)"                                            || no "jq"
cmd_existe make           && ok "make"        "$(make --version | head -1 | awk '{print $3}')"             || no "make"
cmd_existe rustc          && ok "rust"        "$(rustc --version | awk '{print $2}')"                      || no "rust"
cmd_existe go             && ok "go"          "$(go version | awk '{print $3}')"                           || no "go"
cmd_existe java           && ok "java"        "$(java --version 2>&1 | head -1)"                           || no "java"

# ── FOOTER ────────────────────────────────────
echo ""
echo -e "   ${BOLD}${CYAN}╔═══════════════════════════════════════════╗${NC}"
printf  "   ${BOLD}${CYAN}║${NC}  ${GRAY}%-41s${BOLD}${CYAN}║${NC}\n" "$T_SAVE"
printf  "   ${BOLD}${CYAN}║${NC}  ${GRAY}%-41s${BOLD}${CYAN}║${NC}\n" "bash tools.sh --lang $IDIOMA > list.txt"
echo -e "   ${BOLD}${CYAN}╚═══════════════════════════════════════════╝${NC}"
echo ""
