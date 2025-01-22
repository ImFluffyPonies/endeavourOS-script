#!/bin/bash

cd ~/Downloads

echo "Performing system update and downloading essential packages..."
echo "Press any key to continue..."
read -n 1 -s

sudo pacman -Syyu --noconfirm
sudo pacman -S i3 polybar rofi picom dunst feh kitty autorandr thunar neovim tmux zsh zoxide eza ttf-jetbrains-mono-nerd discord github-cli starship sddm --noconfirm

sudo pacman -S python fastfetch btop fzf ripgrep --noconfirm

echo "Setting up nvm and go"
echo "Press any key to continue..."
read -n 1 -s

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

wget https://go.dev/dl/go1.23.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.23.5.linux-amd64.tar.gz

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

nvm install --lts

echo "Installing zen-browser and envycontrol..."
echo "Press any key to continue..."
read -n 1 -s

yay -S zen-browser-bin envycontrol --noconfirm

echo "Setting up dotfiles..."
echo "Press any key to continue..."
read -n 1 -s

rm -rf ~/.config/
git clone https://github.com/ImFluffyPonies/endevouros-dotfiles.git ~/.config/

echo "Setting up zsh..."
echo "Press any key to continue..."
read -n 1 -s

chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

mv ~/.config/.zshrc ~

echo "Setting up gtk-theme, icons and cursor theme..."
echo "Press any key to continue..."
read -n 1 -s

yay -S papirus-icon-theme-git --noconfirm

git clone https://github.com/vinceliuice/WhiteSur-cursors.git ~/Downloads/WhiteSur-cursors
cd ~/Downloads/WhiteSur-cursors/install.sh
./install.sh

cd ~/Downloads

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd WhiteSur-gtk-theme
./install.sh -o normal -c dark -t blue -s standard -N glassy -l -HD --shell -i arch -sf -h smaller -p 75
./tweaks.sh -f

cd ~/Downloads

echo
echo "Installation complete. Please reboot your system."
