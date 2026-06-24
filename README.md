# check_yourself_b4_u_grep_yourself

Feeling Bashful? 💻 This repo will make you `terminal`ly ill from shell shock

A small personal repository of shell scripts, macOS setup helpers, and dotfile installation support.

## Purpose
This repo contains tools and configuration for quickly provisioning a macOS machine and managing personal shell scripts:
- `new_machine_installation/`: install and configure macOS tools, apps, SSH, dotfiles, and manual elements
- `dotfiles/`: personal dotfiles packaged for GNU Stow
- `scripts/`: miscellaneous Bash notes, helpers, and utility scripts

## how to install
- run `./new_machine_installation/main.sh` in zsh on MacOS
  - runs each `*.sh` file new_machine_installation/scripts/
  - exits immediately if any script fails
