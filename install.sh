#!/bin/bash

cd

echo "Installing needed packages..."
sleep 2
sudo pacman -Syu unzip hyprpicker noto-fonts-emoji noto-fonts noto-fonts-cjk nwg-look gthumb haruna imagemagick base-devel hyprland waybar wofi firefox thunar ttf-font-awesome otf-font-awesome ttf-jetbrains-mono fish pkgfile ttf-dejavu inetutils fastfetch pavucontrol hyprshot hyprlock gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb udisks2 swww git
sudo pacman -R vim

echo "Compiling vim with system clipboard enabled..."
sleep 2
git clone https://github.com/vim/vim.git
cd vim
./configure \
    --with-features=huge \
    --enable-multibyte \
    --enable-python3interp=yes \
    --with-python3-command=python \
    --enable-cscope \
    --enable-terminal \
    --enable-autoservername \
    --enable-fontset \
    --with-wayland \
    --enable-gui=no \
    --with-x=no

make -j$(nproc)
sudo make install
cd

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

echo ""
echo "Are you using Artix Linux? (dinit)"
read -p "Enter 'yes' or 'no': " use_artix

echo "Copying scripts to ~/.scripts/..."
sleep 2
mkdir -p ~/.scripts/

cp ~/MyHyprConfigs/wallpaper.sh ~/.scripts/
cp ~/MyHyprConfigs/eye.sh ~/.scripts/
cp ~/MyHyprConfigs/wofi-search.sh ~/.scripts/

if [[ "$use_artix" =~ ^[Yy][Ee][Ss]$|^[Yy]$ ]]; then
    echo "Using Artix version of power menu (loginctl)..."
    cp ~/MyHyprConfigs/power-menu-artix.sh ~/.scripts/power-menu.sh
else
    echo "Using standard version of power menu (reboot/poweroff)..."
    cp ~/MyHyprConfigs/power-menu.sh ~/.scripts/power-menu.sh
fi

chmod +x ~/.scripts/power-menu.sh
chmod +x ~/.scripts/wofi-search.sh
chmod +x ~/.scripts/eye.sh
chmod +x ~/.scripts/wallpaper.sh

echo "Extracting the cursor theme..."
sleep 2
unzip ~/MyHyprConfigs/Moga-Candy-Black.zip

echo "Copying the cursor theme..."
sleep 2
mkdir -p ~/.local/share/icons/
sudo cp -rf ~/Moga-Candy-Black/Moga-Candy-Black/ ~/.local/share/icons/

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
