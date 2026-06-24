#!/bin/bash
set -euo pipefail

# Install Homebrew if not already installed
if ! command -v brew &>/dev/null; then
    echo "→ Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✓ Homebrew already installed"
fi

# Make sure brew is in PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Update Homebrew
echo "→ Updating Homebrew"
brew update
brew upgrade
brew cleanup

eval "$(/opt/homebrew/bin/brew shellenv)"

# Formulae
homebrew_apps=(
    bat
    ffmpeg
    fzf
    gh
    git
    jq
    pyenv
    qrencode
    stow
    tree
    uv
    zoxide
)

for app in "${homebrew_apps[@]}"; do
    if brew list "$app" &>/dev/null; then
        echo "✓ $app already installed"
    else
        echo "→ Installing $app"
        brew install "$app"
    fi
done

# Pyenv
echo "=== Setting up pyenv ==="
global_python_version="3.12.6"
pyenv install "$global_python_version"
pyenv global "$global_python_version"

# sqlfmt
if ! command -v sqlfmt &>/dev/null; then
    echo "→ Installing sqlfmt"
    uv tool install "shandy-sqlfmt[jinjafmt]"
else
    echo "✓ sqlfmt already installed"
fi

# Cask Apps
homebrew_cask_apps=(
    alt-tab
    bettertouchtool
    calibre
    firefox
    iterm2
    obsidian
    qobuz
    raycast
    slack
    transmission
    visual-studio-code
)

for app in "${homebrew_cask_apps[@]}"; do
    if brew list --cask "$app" &>/dev/null; then
        echo "✓ $app already installed"
    else
        echo "→ Installing $app"
        brew install --cask "$app"
    fi
done

# Firefox
if command -v firefox &>/dev/null; then
    open -a "Firefox" --args --make-default-browser
fi
