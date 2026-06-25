#!/bin/bash
# main.sh - Execute all scripts in the scripts/ folder in order

# warn users not to blindly run scripts
echo "This script will install software and modify system settings."
echo "Please ensure you have read and understand the scripts in the scripts/ and dotfiles/ folders before proceeding."
read -r -p "Press y to continue: " CONTINUE
if [[ "$CONTINUE" != "y" ]]; then
    echo "Exiting."
    exit 1
fi

# warn if not running in zsh
if [[ -z "$ZSH_VERSION" ]]; then
    echo "Warning: This script is intended to be run in zsh. Some features may not work as expected."
    read -r -p "Press y to continue anyways: " CONTINUE
    if [[ "$CONTINUE" != "y" ]]; then
        echo "Exiting."
        exit 1
    fi
fi

SCRIPT_DIR="$(dirname "$0")/scripts"

for script in "$SCRIPT_DIR"/*.sh; do
    echo "Running $script..."
    if ! bash "$script"; then
        echo "Error executing $script. Exiting."
        exit 1
    fi
done

echo "All scripts executed successfully."
