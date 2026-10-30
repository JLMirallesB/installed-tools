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
        T_DISK="Espai lliure"
        T_BASIC="EINES BÀSIQUES"
        T_HOMEBREW="HOMEBREW (brew)"
        T_BREW_LEAVES="Instal·lats expressament:"
        T_BREW_DEPS="+ %s dependències instal·lades automàticament"
        T_CASKS="Aplicacions (casks):"
        T_PYTHON="PYTHON"
        T_INTERP="Intèrprets:"
        T_PIP_PKGS="Paquets pip de python3:"
        T_USER_SITE="Paquets pip --user (fora de qualsevol entorn):"
        T_PKGS="paquets"
        T_VENVS="ENTORNS VIRTUALS (Python)"
        T_DUP="%s entorns inclouen %s (cadascun amb la seua còpia)"
        T_UV="UV / UVX"
        T_UV_TOOLS="Eines instal·lades amb uv tool / uvx:"
        T_UV_INCL="inclòs en uv"
        T_NODE="NODE.JS / NPM"
        T_NPM_PKGS="Paquets npm globals:"
        T_NM="Carpetes node_modules: %s · %s en total"
        T_RUBY="RUBY"
        T_GEM_PKGS="Gems instal·lades:"
        T_GEM_SYS="Ruby del sistema: %s gems (venen amb macOS)"
        T_AI="EINES D'IA (CLI)"
        T_MODELS="MODELS D'IA (locals)"
        T_CACHES="MEMÒRIES CAU (es poden netejar)"
        T_OTHERS="ALTRES"
        T_SEARCHING="Cercant a la carpeta personal…"
        T_NONE="cap"
        T_NOT_INST="no instal·lat"
        T_SAVE="Per desar el llistat en un fitxer:"
        ;;
    es)
        T_TITLE="HERRAMIENTAS INSTALADAS"
        T_SYSTEM="SISTEMA"
        T_DISK="Espacio libre"
        T_BASIC="HERRAMIENTAS BÁSICAS"
        T_HOMEBREW="HOMEBREW (brew)"
        T_BREW_LEAVES="Instalados expresamente:"
        T_BREW_DEPS="+ %s dependencias instaladas automáticamente"
        T_CASKS="Aplicaciones (casks):"
        T_PYTHON="PYTHON"
        T_INTERP="Intérpretes:"
        T_PIP_PKGS="Paquetes pip de python3:"
        T_USER_SITE="Paquetes pip --user (fuera de cualquier entorno):"
        T_PKGS="paquetes"
        T_VENVS="ENTORNOS VIRTUALES (Python)"
        T_DUP="%s entornos incluyen %s (cada uno con su copia)"
        T_UV="UV / UVX"
        T_UV_TOOLS="Herramientas instaladas con uv tool / uvx:"
        T_UV_INCL="incluido en uv"
        T_NODE="NODE.JS / NPM"
        T_NPM_PKGS="Paquetes npm globales:"
        T_NM="Carpetas node_modules: %s · %s en total"
        T_RUBY="RUBY"
        T_GEM_PKGS="Gems instaladas:"
        T_GEM_SYS="Ruby del sistema: %s gems (vienen con macOS)"
        T_AI="HERRAMIENTAS DE IA (CLI)"
        T_MODELS="MODELOS DE IA (locales)"
        T_CACHES="CACHÉS (se pueden limpiar)"
        T_OTHERS="OTROS"
        T_SEARCHING="Buscando en la carpeta personal…"
        T_NONE="ninguno"
        T_NOT_INST="no instalado"
        T_SAVE="Para guardar el listado en un archivo:"
        ;;
    *)  # en (default)
        T_TITLE="INSTALLED TOOLS"
        T_SYSTEM="SYSTEM"
        T_DISK="Free space"
        T_BASIC="BASIC TOOLS"
        T_HOMEBREW="HOMEBREW (brew)"
        T_BREW_LEAVES="Installed on request:"
        T_BREW_DEPS="+ %s dependencies installed automatically"
        T_CASKS="Apps (casks):"
        T_PYTHON="PYTHON"
        T_INTERP="Interpreters:"
        T_PIP_PKGS="pip packages of python3:"
        T_USER_SITE="pip --user packages (outside any environment):"
        T_PKGS="packages"
        T_VENVS="VIRTUAL ENVIRONMENTS (Python)"
        T_DUP="%s environments include %s (each with its own copy)"
        T_UV="UV / UVX"
        T_UV_TOOLS="Tools installed with uv tool / uvx:"
        T_UV_INCL="included in uv"
        T_NODE="NODE.JS / NPM"
        T_NPM_PKGS="Global npm packages:"
        T_NM="node_modules folders: %s · %s in total"
        T_RUBY="RUBY"
        T_GEM_PKGS="Installed gems:"
        T_GEM_SYS="System Ruby: %s gems (bundled with macOS)"
        T_AI="AI TOOLS (CLI)"
        T_MODELS="AI MODELS (local)"
        T_CACHES="CACHES (safe to clean)"
        T_OTHERS="OTHER"
        T_SEARCHING="Searching your home folder…"
        T_NONE="none"
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

aviso() {
    printf "   ${YELLOW}⚠${NC}  %s\n" "$1"
}

subtitulo() {
    echo ""
    echo -e "   ${YELLOW}$1${NC}"
}

# Bullet line; with two arguments the first one is a size column.
item() {
    if [[ $# -gt 1 ]]; then
        printf "     ${GRAY}•${NC} ${BOLD}%6s${NC}  %s\n" "$1" "$2"
    else
        printf "     ${GRAY}•${NC} %s\n" "$1"
    fi
}

cmd_existe() {
    command -v "$1" &> /dev/null
}

# Size in KB of a path, and KB → human readable (1.3G, 775M…).
kb() {
    du -sk "$1" 2>/dev/null | awk '{print $1}'
}

humano() {
    awk -v k="${1:-0}" 'BEGIN {
        if (k >= 1048576) printf "%.1fG", k / 1048576
        else if (k >= 1024) printf "%.0fM", k / 1024
        else printf "%dK", k
    }'
}

# Show $HOME as ~ to keep lines short.
corta() {
    case "$1" in
        "$HOME"*) echo "~${1#$HOME}" ;;
        *) echo "$1" ;;
    esac
}

# ── MAIN HEADER ───────────────────────────────
MACOS_VER="$(sw_vers -productVersion)"
ARCH="$(uname -m)"
DATE_STR="$(date '+%d/%m/%Y · %H:%M')"
TIENE_CLT=""
xcode-select -p &> /dev/null && TIENE_CLT="1"

echo -e "   ${BOLD}${CYAN}╔═══════════════════════════════════════════╗${NC}"
printf "   ${BOLD}${CYAN}║${NC}  ${BOLD}%-41s${BOLD}${CYAN}║${NC}\n" "$T_TITLE"
printf "   ${BOLD}${CYAN}║${NC}  ${GRAY}%-41s${BOLD}${CYAN}║${NC}\n" "$DATE_STR  ·  macOS $MACOS_VER"
echo -e "   ${BOLD}${CYAN}╚═══════════════════════════════════════════╝${NC}"

# ── SYSTEM ────────────────────────────────────
seccion "$T_SYSTEM"
ok "macOS" "$MACOS_VER  ($ARCH)"
ok "Xcode CLT" "$([[ -n $TIENE_CLT ]] && echo 'installed' || echo "$T_NOT_INST")"
ok "$T_DISK" "$(df -h "$HOME" | awk 'NR==2 {print $4}')"

# ── BASIC TOOLS ───────────────────────────────
seccion "$T_BASIC"
cmd_existe git  && ok "git"     "$(git --version | awk '{print $3}')"              || no "git"
cmd_existe curl && ok "curl"    "$(curl --version | head -1 | awk '{print $2}')"   || no "curl"
cmd_existe wget && ok "wget"    "$(wget --version 2>&1 | head -1 | awk '{print $3}')" || no "wget"
cmd_existe code && ok "VS Code" "$(code --version 2>/dev/null | head -1)"          || no "VS Code"
cmd_existe ssh  && ok "ssh"     "$(ssh -V 2>&1 | awk '{print $1}' | tr -d ',')"    || no "ssh"

# ── HOMEBREW ──────────────────────────────────
seccion "$T_HOMEBREW"
if cmd_existe brew; then
    ok "brew" "$(brew --version | head -1 | awk '{print $2}')"
    # Only what was installed on request; dependencies are just counted.
    HOJAS="$(brew leaves 2>/dev/null)"
    subtitulo "$T_BREW_LEAVES"
    if [[ -n "$HOJAS" ]]; then
        brew list --versions $HOJAS 2>/dev/null | sort | while IFS= read -r line; do
            item "$line"
        done
    fi
    N_TODOS=$(brew list --formula 2>/dev/null | wc -l | tr -d ' ')
    N_HOJAS=$(echo "$HOJAS" | grep -c .)
    printf "     ${GRAY}${T_BREW_DEPS}${NC}\n" "$((N_TODOS - N_HOJAS))"
    CASKS="$(brew list --cask --versions 2>/dev/null)"
    if [[ -n "$CASKS" ]]; then
        subtitulo "$T_CASKS"
        echo "$CASKS" | sort | while IFS= read -r line; do
            item "$line"
        done
    fi
else
    no "brew"
fi

# ── PYTHON ────────────────────────────────────
seccion "$T_PYTHON"
if cmd_existe python3; then
    ok "python3" "$(python3 --version 2>&1 | awk '{print $2}')  ($(corta "$(command -v python3)"))"
fi

# Every interpreter found in the usual places, once each.
# /usr/bin/python3 is only a stub without the Command Line Tools: skip it then.
subtitulo "$T_INTERP"
CANDIDATOS=()
[[ -n $TIENE_CLT ]] && CANDIDATOS+=("/usr/bin/python3")
for p in /opt/homebrew/bin/python3.[0-9]* /usr/local/bin/python3.[0-9]* \
         "$HOME"/.local/share/uv/python/*/bin/python3 \
         "$HOME"/.pyenv/versions/*/bin/python \
         /Library/Frameworks/Python.framework/Versions/*/bin/python3 \
         "$HOME"/miniconda3/bin/python "$HOME"/anaconda3/bin/python \
         /opt/homebrew/Caskroom/miniconda/base/bin/python; do
    [[ -x "$p" && "$p" != *-config ]] && CANDIDATOS+=("$p")
done
VISTOS=""
for p in "${CANDIDATOS[@]}"; do
    info="$("$p" -c 'import sys; print(sys.version.split()[0], sys.base_prefix)' 2>/dev/null)" || continue
    ver="${info%% *}"
    # uv keeps "cpython-3.12" as a link to "cpython-3.12.12": same install, two paths.
    base="$(cd "${info#* }" 2>/dev/null && pwd -P)"
    case "$VISTOS" in *"|$base|"*) continue ;; esac
    VISTOS="$VISTOS|$base|"
    case "$p" in
        /usr/bin/*)                origen="macOS" ;;
        /opt/homebrew/*Caskroom*)  origen="conda" ;;
        /opt/homebrew/*|/usr/local/bin/*) origen="Homebrew" ;;
        */uv/python/*)             origen="uv" ;;
        */.pyenv/*)                origen="pyenv" ;;
        /Library/Frameworks/*)     origen="python.org" ;;
        *conda3*)                  origen="conda" ;;
        *)                         origen="" ;;
    esac
    printf "     ${GRAY}•${NC} ${BOLD}%-9s${NC} %-10s ${GRAY}%s${NC}\n" "$ver" "$origen" "$(corta "$p")"
done

if cmd_existe pip3; then
    N_PIP=$(pip3 list 2>/dev/null | tail -n +3 | wc -l | tr -d ' ')
    if [[ "$N_PIP" -gt 0 ]]; then
        subtitulo "$T_PIP_PKGS"
        pip3 list 2>/dev/null | tail -n +3 | while IFS= read -r line; do
            item "$line"
        done
    fi
fi

# Packages installed with `pip install --user` live outside every environment.
for d in "$HOME"/Library/Python/*/lib/python/site-packages; do
    [[ -d "$d" ]] || continue
    n=$(ls -d "$d"/*.dist-info 2>/dev/null | wc -l | tr -d ' ')
    [[ "$n" -gt 0 ]] || continue
    subtitulo "$T_USER_SITE"
    item "$(humano "$(kb "$d")")" "$n $T_PKGS  $(corta "$d")"
done

# ── VIRTUAL ENVIRONMENTS ──────────────────────
seccion "$T_VENVS"
printf "   ${GRAY}%s${NC}\n" "$T_SEARCHING"
# Heavy libraries worth flagging: one copy per environment adds up fast.
PESADAS="torch tensorflow jax mlx transformers onnxruntime"
TODAS_PESADAS=""
FILAS=""
while IFS= read -r cfg; do
    v="${cfg%/pyvenv.cfg}"
    ver="$(grep -E '^(version|version_info) *=' "$cfg" | head -1 | sed 's/.*= *//')"
    site="$(ls -d "$v"/lib/python3*/site-packages 2>/dev/null | head -1)"
    libs=""
    for lib in $PESADAS; do
        if ls -d "$site"/"$lib"-[0-9]*.dist-info &> /dev/null; then
            libs="$libs $lib"
            TODAS_PESADAS="$TODAS_PESADAS $lib"
        fi
    done
    k="$(kb "$v")"
    FILAS="$FILAS$k	$(humano "$k")	py${ver%.*}	$(corta "$v")	$libs
"
done < <(find "$HOME" -maxdepth 6 \
            \( -name Library -o -name .Trash -o -name .cache -o -name node_modules -o -name .git \) -prune \
            -o -name pyvenv.cfg -print 2>/dev/null)

if [[ -z "$FILAS" ]]; then
    item "$T_NONE"
else
    printf "%s" "$FILAS" | sort -rn | while IFS='	' read -r k tam ver ruta libs; do
        printf "     ${GRAY}•${NC} ${BOLD}%6s${NC}  %-7s %s${YELLOW}%s${NC}\n" "$tam" "$ver" "$ruta" "$libs"
    done
    for lib in $PESADAS; do
        n=$(echo "$TODAS_PESADAS" | tr ' ' '\n' | grep -cx "$lib")
        [[ "$n" -gt 1 ]] && aviso "$(printf "$T_DUP" "$n" "$lib")"
    done
fi

# ── UV / UVX ──────────────────────────────────
seccion "$T_UV"
if cmd_existe uv; then
    ok "uv"  "$(uv --version 2>&1 | awk '{print $2}')"
    ok "uvx" "$T_UV_INCL"
    echo ""
    echo -e "   ${YELLOW}${T_UV_TOOLS}${NC}"
    uv tool list 2>/dev/null | grep -v '^- ' | while IFS= read -r line; do
        item "$line"
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
    npm list -g --depth=0 2>/dev/null | tail -n +2 | sed 's/^[├└│─ ]*//' | grep . | while IFS= read -r line; do
        item "$line"
    done
    # Each project keeps its own node_modules: show the biggest ones.
    NM_FILAS=""
    while IFS= read -r d; do
        k="$(kb "$d")"
        NM_FILAS="$NM_FILAS$k	$(corta "$d")
"
    done < <(find "$HOME" -maxdepth 6 \( -path "$HOME/.*" -o -name Library -o -name .Trash \) -prune \
                -o -type d -name node_modules -prune -print 2>/dev/null)
    if [[ -n "$NM_FILAS" ]]; then
        N_NM=$(printf "%s" "$NM_FILAS" | grep -c .)
        T_KB=$(printf "%s" "$NM_FILAS" | awk -F'\t' '{s += $1} END {print s}')
        subtitulo "$(printf "$T_NM" "$N_NM" "$(humano "$T_KB")")"
        printf "%s" "$NM_FILAS" | sort -rn | head -5 | while IFS='	' read -r k ruta; do
            item "$(humano "$k")" "$ruta"
        done
    fi
else
    no "node"
fi

# ── RUBY ──────────────────────────────────────
seccion "$T_RUBY"
cmd_existe ruby && ok "ruby" "$(ruby --version | awk '{print $2}')" || no "ruby"
cmd_existe gem  && ok "gem"  "$(gem --version)"                     || no "gem"
if cmd_existe gem; then
    # The gems bundled with the system Ruby are noise: just count them.
    if [[ "$(command -v ruby)" == /usr/bin/ruby ]]; then
        printf "     ${GRAY}${T_GEM_SYS}${NC}\n" "$(gem list 2>/dev/null | grep -c .)"
    else
        echo ""
        echo -e "   ${YELLOW}${T_GEM_PKGS}${NC}"
        gem list 2>/dev/null | while IFS= read -r line; do
            item "$line"
        done
    fi
fi

# ── AI TOOLS (CLI) ────────────────────────────
seccion "$T_AI"
cmd_existe claude && ok "Claude Code" "$(claude --version 2>&1 | head -1)"  || no "Claude Code"
cmd_existe codex  && ok "Codex"       "$(codex --version 2>&1 | head -1)"   || no "Codex"
cmd_existe gemini && ok "Gemini CLI"  "$(gemini --version 2>&1 | head -1)"  || no "Gemini CLI"
cmd_existe aider  && ok "aider"       "$(aider --version 2>&1 | head -1)"   || no "aider"
cmd_existe ollama && ok "Ollama"      "$(ollama --version 2>&1 | tail -1 | awk '{print $NF}')"  || no "Ollama"
cmd_existe sgpt   && ok "sgpt"        "$(sgpt --version 2>&1 | head -1)"    || no "sgpt"
cmd_existe llm    && ok "llm"         "$(llm --version 2>&1 | head -1)"     || no "llm"
cmd_existe fabric && ok "fabric"      "$(fabric --version 2>&1 | head -1)"  || no "fabric"

# ── AI MODELS (local) ─────────────────────────
seccion "$T_MODELS"
HAY_MODELOS=""
if [[ -d "$HOME/.ollama/models" ]]; then
    HAY_MODELOS="1"
    ok "Ollama" "$(humano "$(kb "$HOME/.ollama/models")")  ($(corta "$HOME/.ollama/models"))"
    cmd_existe ollama && ollama list 2>/dev/null | tail -n +2 | awk '{print $3 $4 "\t" $1}' | \
        while IFS='	' read -r tam nombre; do item "$tam" "$nombre"; done
fi
HF="$HOME/.cache/huggingface/hub"
if [[ -d "$HF" ]]; then
    HAY_MODELOS="1"
    ok "Hugging Face" "$(humano "$(kb "$HF")")  ($(corta "$HF"))"
    for m in "$HF"/models--*; do
        [[ -d "$m" ]] || continue
        k="$(kb "$m")"
        nombre="${m##*/models--}"
        echo "$k	${nombre//--//}"
    done | sort -rn | while IFS='	' read -r k nombre; do item "$(humano "$k")" "$nombre"; done
fi
for d in "$HOME/.cache/whisper" "$HOME/.cache/torch" "$HOME/.lmstudio/models" "$HOME/.cache/lm-studio/models"; do
    [[ -d "$d" ]] || continue
    HAY_MODELOS="1"
    ok "$(basename "$(dirname "$d")")/$(basename "$d")" "$(humano "$(kb "$d")")  ($(corta "$d"))"
done
[[ -z $HAY_MODELOS ]] && item "$T_NONE"

# ── CACHES ────────────────────────────────────
seccion "$T_CACHES"
UV_CACHE="$HOME/.cache/uv"
cmd_existe uv && UV_CACHE="$(uv cache dir 2>/dev/null)"
# name | path | command that cleans it
CACHES=(
    "uv|$UV_CACHE|uv cache prune"
    "npm|$HOME/.npm/_cacache|npm cache clean --force"
    "pip|$HOME/Library/Caches/pip|pip3 cache purge"
    "Homebrew|$HOME/Library/Caches/Homebrew|brew cleanup"
    "Yarn|$HOME/Library/Caches/Yarn|yarn cache clean"
    "pnpm|$HOME/Library/pnpm/store|pnpm store prune"
    "node-gyp|$HOME/Library/Caches/node-gyp|"
    "Go|$HOME/go/pkg/mod|go clean -modcache"
    "Cargo|$HOME/.cargo/registry|"
    "Gradle|$HOME/.gradle/caches|"
    "CocoaPods|$HOME/Library/Caches/CocoaPods|pod cache clean --all"
)
for c in "${CACHES[@]}"; do
    nombre="${c%%|*}"; resto="${c#*|}"
    ruta="${resto%%|*}"; limpiar="${resto#*|}"
    [[ -d "$ruta" ]] || continue
    printf "   ${GREEN}✓${NC} ${BOLD}%-20s${NC} %6s  ${GRAY}%s${NC}\n" "$nombre" "$(humano "$(kb "$ruta")")" "$limpiar"
done

# ── OTHER ─────────────────────────────────────
seccion "$T_OTHERS"
cmd_existe docker         && ok "docker"      "$(docker --version | awk '{print $3}' | tr -d ',')"         || no "docker"
cmd_existe docker-compose && ok "docker-comp" "$(docker-compose --version | awk '{print $4}' | tr -d ',')" || no "docker-compose"
cmd_existe ffmpeg         && ok "ffmpeg"      "$(ffmpeg -version 2>&1 | head -1 | awk '{print $3}')"       || no "ffmpeg"
cmd_existe jq             && ok "jq"          "$(jq --version)"                                            || no "jq"
cmd_existe make           && ok "make"        "$(make --version | head -1 | awk '{print $3}')"             || no "make"
cmd_existe rustc          && ok "rust"        "$(rustc --version | awk '{print $2}')"                      || no "rust"
cmd_existe go             && ok "go"          "$(go version | awk '{print $3}')"                           || no "go"
# /usr/bin/java exists even without a Java runtime: ask it before trusting it.
cmd_existe java && java -version &> /dev/null && ok "java" "$(java --version 2>&1 | head -1)" || no "java"

# ── FOOTER ────────────────────────────────────
echo ""
echo -e "   ${BOLD}${CYAN}╔═══════════════════════════════════════════╗${NC}"
printf  "   ${BOLD}${CYAN}║${NC}  ${GRAY}%-41s${BOLD}${CYAN}║${NC}\n" "$T_SAVE"
printf  "   ${BOLD}${CYAN}║${NC}  ${GRAY}%-41s${BOLD}${CYAN}║${NC}\n" "bash $(basename "$0") --lang $IDIOMA > list.txt"
echo -e "   ${BOLD}${CYAN}╚═══════════════════════════════════════════╝${NC}"
echo ""
