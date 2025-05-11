#!/bin/bash

set -euo pipefail

# Update and upgrade the system

sudo apt update && sudo apt full-upgrade -y

# Install core packages

sudo apt install -y 
sway wofi foot 
pipewire wireplumber pavucontrol 
tmux git curl wget unzip 
zsh zoxide fzf 
openssh-server 
fonts-jetbrains-mono 
grim slurp wl-clipboard jq 
build-essential libssl-dev

# Create user-level config directories

mkdir -p ~/.config/sway ~/.config/foot ~/.config/yazi

# Set zsh as default shell

chsh -s $(which zsh)

# Enable ssh service

sudo systemctl enable ssh

# Basic sway config

cat <<EOF > ~/.config/sway/config exec foot exec wofi --show drun exec pipewire & wireplumber bindsym Print exec grim -g "$(slurp)" - | wl-copy EOF

# Basic yazi config

cat <<EOF > ~/.config/yazi/yazi.toml [manager] show_hidden = true EOF

echo "Bootstrap complete. You may now reboot and start sway with 'sway' or set up a login manager."

