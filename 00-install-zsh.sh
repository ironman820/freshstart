#!/usr/bin/env bash
set -euo pipefail

# Install zsh from the arch repos
echo "Installing ZSH"
sudo pacman -Sy --noconfirm zsh

# Change default shell to ZSH
echo "Setting ZSH as the default Shell"
chsh -s $(which zsh)

# Install Oh-My-ZSH for extras
echo "Installing Oh-my-zsh. You may need to exit from the prompt when it is complete."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install an AUR Helper to complete the installation
echo "Installing AUR Helper to finish the install"
zsh -c $PWD/02-setup-aur-helper.zsh

# Install Nerd Fonts to support Starship
echo "Installing fonts to support Starship prompt"
paru -Sy --noconfirm nerd-fonts-complete

# Install Starfish
echo "Installing Starship Prompt"
curl -fsSL https://starship.rs/install.sh | bash
echo 'eval "$(starship init zsh)"' >> .zshrc

echo "Logging out to finish the change to Zsh"
logout
