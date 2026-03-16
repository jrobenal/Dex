#!/usr/bin/env bash
# Dex Sales — One-command setup for Amazon Kiro
# Run this once after cloning: ./dex-setup.sh

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
RESET='\033[0m'

echo ""
echo -e "${BOLD}Dex Sales Setup${RESET}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Detect vault path (the directory this script lives in)
VAULT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo -e "📁 Vault: ${GREEN}$VAULT_PATH${RESET}"
echo ""

# ── Python check ──────────────────────────────────────────────
PYTHON=""
for cmd in python3 python; do
    if command -v $cmd &>/dev/null; then
        VER=$($cmd -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')" 2>/dev/null)
        MAJOR=$(echo $VER | cut -d. -f1)
        MINOR=$(echo $VER | cut -d. -f2)
        if [ "$MAJOR" -ge 3 ] && [ "$MINOR" -ge 10 ]; then
            PYTHON=$cmd
            break
        fi
    fi
done
if [ -z "$PYTHON" ]; then
    echo -e "${RED}✗ Python 3.10+ not found.${RESET}"
    echo "  Download from https://www.python.org/downloads/"
    echo "  Then re-run this script."
    exit 1
fi
echo -e "✓ Python: $($PYTHON --version)"

# ── Node.js check ─────────────────────────────────────────────
if ! command -v node &>/dev/null; then
    echo -e "${RED}✗ Node.js not found.${RESET}"
    echo "  Download the LTS version from https://nodejs.org/"
    echo "  Then re-run this script."
    exit 1
fi
NODE_VER=$(node -e "process.stdout.write(process.version.slice(1).split('.')[0])")
if [ "$NODE_VER" -lt 18 ]; then
    echo -e "${RED}✗ Node.js 18+ required (you have $(node --version)).${RESET}"
    echo "  Download the LTS version from https://nodejs.org/"
    exit 1
fi
echo -e "✓ Node.js: $(node --version)"

echo ""

# ── Install Python dependencies ───────────────────────────────
echo -n "Installing Python dependencies... "
$PYTHON -m pip install --quiet --upgrade pip 2>/dev/null || true
$PYTHON -m pip install --quiet --user "mcp>=1.0.0,<2.0.0" pyyaml python-dateutil
echo -e "${GREEN}done${RESET}"

# ── Install Node dependencies ─────────────────────────────────
echo -n "Installing Node.js dependencies... "
cd "$VAULT_PATH"
npm install --silent 2>/dev/null
echo -e "${GREEN}done${RESET}"

# ── Bake VAULT_PATH into MCP config ──────────────────────────
echo -n "Configuring MCP servers... "
MCP_TEMPLATE="$VAULT_PATH/.kiro/settings/mcp.json"
if [ -f "$MCP_TEMPLATE" ]; then
    # Replace ${VAULT_PATH} placeholder with actual path
    $PYTHON -c "
import re, sys
with open('$MCP_TEMPLATE') as f:
    content = f.read()
content = content.replace('\${VAULT_PATH}', '$VAULT_PATH')
with open('$MCP_TEMPLATE', 'w') as f:
    f.write(content)
"
    echo -e "${GREEN}done${RESET}"
else
    echo -e "${YELLOW}skipped (mcp.json not found)${RESET}"
fi

# ── macOS: set VAULT_PATH system-wide so Kiro picks it up ─────
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo -n "Setting VAULT_PATH for Kiro (macOS)... "
    launchctl setenv VAULT_PATH "$VAULT_PATH" 2>/dev/null || true
    echo -e "${GREEN}done${RESET}"
fi

# ── Add to shell profile for terminal sessions ────────────────
PROFILE=""
if [ -f "$HOME/.zshrc" ]; then
    PROFILE="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    PROFILE="$HOME/.bashrc"
elif [ -f "$HOME/.bash_profile" ]; then
    PROFILE="$HOME/.bash_profile"
fi
if [ -n "$PROFILE" ] && ! grep -q "VAULT_PATH" "$PROFILE" 2>/dev/null; then
    echo "" >> "$PROFILE"
    echo "# Dex Sales vault path" >> "$PROFILE"
    echo "export VAULT_PATH=\"$VAULT_PATH\"" >> "$PROFILE"
    echo -e "✓ Added VAULT_PATH to ${PROFILE}"
fi

# ── macOS calendar permission hint ───────────────────────────
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo ""
    echo -e "${YELLOW}Optional: Calendar access${RESET}"
    echo "  To see your meetings in /daily-plan:"
    echo "  System Settings → Privacy & Security → Calendars → Kiro → Full Access"
fi

# ── Done ──────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN}${BOLD}✅ Dex Sales is ready!${RESET}"
echo ""
echo "  Next steps:"
echo "  1. Restart Kiro (so it picks up the new config)"
echo "  2. Open this folder in Kiro"
echo "  3. Type  /getting-started  in chat"
echo ""
