#!/usr/bin/env bash
# Install `burn` to ~/.local/bin (no sudo required).
set -euo pipefail

REPO="dtnewman/burn-baby-burn"
BASE_URL="https://raw.githubusercontent.com/${REPO}/main/bin"
DEST_DIR="${HOME}/.local/bin"

mkdir -p "$DEST_DIR"
curl -fsSL "$BASE_URL/burn"            -o "$DEST_DIR/burn"
# Sourced by burn when using --backend codex to compute estimated cost.
curl -fsSL "$BASE_URL/codex_rates.sh"  -o "$DEST_DIR/codex_rates.sh"
# Sourced by burn when using --backend gemini to compute estimated cost.
curl -fsSL "$BASE_URL/gemini_rates.sh" -o "$DEST_DIR/gemini_rates.sh"
chmod +x "$DEST_DIR/burn"

echo "✅ installed burn → $DEST_DIR/burn"

case ":${PATH}:" in
  *":${DEST_DIR}:"*)
    echo "🔥 ready to go: run 'burn 10000' to torch some tokens."
    ;;
  *)
    echo
    echo "⚠️  $DEST_DIR is not on your PATH."
    echo "    add this line to your shell rc (~/.zshrc, ~/.bashrc, etc):"
    echo
    echo "      export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo
    echo "    then reload your shell and run 'burn 10000'."
    ;;
esac
