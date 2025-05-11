#!/bin/bash
set -euo pipefail

# Update and upgrade the system
sudo apt update && sudo apt full-upgrade -y

# Install verified core utilities and audio stack (Debian Trixie)
sudo apt install -y \
  wofi \
  tmux git curl wget unzip \
  zsh zoxide fzf \
  openssh-server \
  fonts-jetbrains-mono \
  grim slurp wl-clipboard jq \
  build-essential libssl-dev \
  pipewire wireplumber pavucontrol

# Create user-level config directories
mkdir -p ~/.config/{sway,foot}

# Set zsh as default shell
chsh -s "$(which zsh)"

# Enable SSH service
sudo systemctl enable ssh

# Basic sway config (overwrite safely)
cat <<EOF > ~/.config/sway/config
exec foot
exec wofi --show drun
exec pipewire & wireplumber
bindsym Print exec grim -g "\$(slurp)" - | wl-copy
EOF

echo "Minimal Sway environment prepared. You may now run 'sway' or proceed with system extension."
