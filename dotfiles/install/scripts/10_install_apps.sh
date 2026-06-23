#!/bin/bash
set -euo pipefail

append_if_missing() {
    local file=$1
    local line=$2
    grep -qxF "$line" "$file" 2>/dev/null || echo "$line" >> "$file"
}

# Install Homebrew if not already installed
if ! command -v brew &>/dev/null; then
    echo "→ Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✓ Homebrew already installed"
fi

# Make sure brew is in PATH
append_if_missing ~/.zprofile 'eval "$(/opt/homebrew/bin/brew shellenv)"'
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
    tree
    zsh-autosuggestions
    zsh-syntax-highlighting
)

for app in "${homebrew_apps[@]}"; do
    if brew list "$app" &>/dev/null; then
        echo "✓ $app already installed"
    else
        echo "→ Installing $app"
        brew install "$app"
    fi
done

# Pyenv setup
echo "=== Setting up pyenv ==="
global_python_version="3.12.6"
pyenv install "$global_python_version"
pyenv global "$global_python_version"


# Cask Apps
homebrew_cask_apps=(
    alt-tab
    bettertouchtool
    calibre
    firefox
    google-chrome
    iterm2
    obsidian
    qobuz
    raycast
    slack
    transmission
    visual-studio-code
)

# Idempotent; will just upgrade if already installed
for app in "${homebrew_cask_apps[@]}"; do
    brew install --cask "$app"
done


# Firefox
if command -v firefox &>/dev/null; then
    open -a "Firefox" --args --make-default-browser
fi

# Install/upgrade uv (Astral)
curl -LsSf https://astral.sh/uv/install.sh | sh
