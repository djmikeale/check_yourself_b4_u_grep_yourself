#! /bin/bash

echo "auto-setup remote if not exists"
git config --global --add --bool push.autoSetupRemote true

echo "auto-setup use merge on conflicts"
git config --global pull.rebase false

git config --global user.email "mhthorup@gmail.com"
git config --global user.name "Mikael Thorup"
