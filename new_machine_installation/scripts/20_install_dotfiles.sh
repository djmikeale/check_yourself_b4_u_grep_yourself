#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
DOTFILES_DIR="$REPO_DIR/dotfiles"
PACKAGE_NAME="home"
TARGET_DIR="$HOME"

if ! command -v stow &>/dev/null; then
    echo "⚠️  GNU Stow is not installed. Run new_machine_installation/scripts/10_install_apps.sh first."
    exit 1
fi

if [[ ! -d "$DOTFILES_DIR/$PACKAGE_NAME" ]]; then
    echo "⚠️  Missing stow package: $DOTFILES_DIR/$PACKAGE_NAME"
    exit 1
fi

cd "$DOTFILES_DIR"

echo "→ Stowing dotfiles from package '$PACKAGE_NAME' into '$TARGET_DIR'"

stow --dir="$DOTFILES_DIR" --target="$TARGET_DIR" --restow "$PACKAGE_NAME"
echo "✓ Dotfiles installed with GNU Stow"
