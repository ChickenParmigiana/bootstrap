#!/bin/bash

set -euo pipefail

# Update and install base packages
sudo apt update && sudo apt full-upgrade -y
sudo apt install -y \
  sway foot wofi \
  pipewire wireplumber pavucontrol \
  piper-espeak-ng \
  tmux git curl wget unzip \
  zsh zoxide fzf \
  yazi \
  openssh-server \
  fonts-jetbrains-mono fonts-jetbrains-mono-nerd \
  grim slurp wl-clipboard jq \
  build-essential libssl-dev

# Create user-level config directories
mkdir -p ~/.config/sway ~/.config/foot ~/.config/yazi

# Set zsh as default shell
chsh -s $(which zsh)

# Enable services
sudo systemctl enable ssh

# Basic Sway config
cat <<EOF > ~/.config/sway/config
exec foot
exec wofi --show drun
exec pipewire & wireplumber
bindsym Print exec grim -g "$(slurp)" - | wl-copy
EOF

# Basic Yazi config
cat <<EOF > ~/.config/yazi/yazi.toml
[manager]
show_hidden = true
EOF

echo "Bootstrap complete. You may now reboot and start Sway with 'sway' or set up a login manager like 'ly'."
