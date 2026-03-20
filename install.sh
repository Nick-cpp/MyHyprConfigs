#!/bin/bash

cd

echo "Installing needed packages..."
sleep 2
sudo pacman -Syu foot udiskie cmus libmad mako ttf-space-mono-nerd unzip hyprpicker noto-fonts-emoji noto-fonts noto-fonts-cjk nwg-look gthumb haruna imagemagick base-devel hyprland waybar wofi thunar ttf-font-awesome otf-font-awesome ttf-jetbrains-mono fish pkgfile ttf-dejavu inetutils fastfetch pavucontrol hyprshot hyprlock gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb udisks2 swww git
doas emerge --unmerge vim

echo "Installing vim plug..."
sleep 2
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Creating ~/Pictures and ~/Pictures/Wallpapers and ~/Pictures/Screenshots directories..."
sleep 2

echo "Installing fish shell..."
chsh -s /bin/fish
mkdir -p ~/Pictures/Wallpapers
mkdir ~/Pictures/Screenshots

echo "Copying wallpapers to ~/Pictures/Wallpapers/..."
sleep 2
cp ~/MyHyprConfigs/Wallpapers/* ~/Pictures/Wallpapers/

echo "Copying scripts to ~/.scripts/..."
sleep 2
mkdir -p ~/.scripts/

cp ~/MyHyprConfigs/scripts/* ~/.scripts/

cp ~/MyHyprConfigs/scripts/power-menu.sh ~/.scripts/power-menu.sh

chmod +x ~/.scripts/*

echo "Extracting the cursor theme..."
sleep 2
unzip ~/MyHyprConfigs/Moga-Candy-Black.zip

echo "Copying the cursor theme..."
sleep 2
mkdir -p ~/.icons/
sudo cp -rf ~/Moga-Candy-Black/Moga-Candy-Black/ ~/.icons/

echo "Copying configs..."
sleep 2
cp ~/MyHyprConfigs/.vimrc ~/.vimrc
cp -rf ~/MyHyprConfigs/configs/* ~/.config/

echo ""
echo "Installer has finished its work."
read -p "Reboot? (y/n): " reboot_choice

if [[ "$reboot_choice" =~ ^[Yy]$ ]]; then
    echo "Rebooting..."
    sudo reboot
else
    echo "Reboot skipped. Changes may require a restart to take effect."
fi
