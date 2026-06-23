#!/bin/bash
set -euo pipefail

# something weird happening that breaks the script after running it; thus putting it separately from other installation settings.
read -r -p "Do you want to import the BetterTouchTool preset? (y/n): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
    if [ -e /Applications/BetterTouchTool.app/Contents/MacOS/BetterTouchTool ]; then
        /Applications/BetterTouchTool.app/Contents/MacOS/BetterTouchTool import_preset Default.bttpreset
        echo "✓ Preset imported"
    else
        echo "⚠️  BetterTouchTool not found — skipping preset import."
    fi
else
    echo "Skipped BetterTouchTool preset import."
fi
