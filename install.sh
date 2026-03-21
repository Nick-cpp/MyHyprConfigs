#!/bin/bash
#DO NOT USE THIS INSTALLATION SCRIPT IS WORK IN PROGRESS

cd

echo "Enabling needed overlays"
doas eselect repository enable guru
doas eselect repository enable hyproverlay
doas emerge --sync

echo "USE-flags"
doas cp ~/MyHyprConfigs/package.use/* /etc/portage/package.use/
doas chown -R root /etc/portage/package.use/

echo "Installing needed packages..."
sleep 2
doas emerge --unmerge vim
doas emerge gui-apps/foot sys-fs/udiskie media-sound/cmus gui-apps/mako app-arch/unzip gui-apps/hyprpicker media-fonts/noto-emoji media-fonts/noto media-fonts/noto-cjk app-misc/nwg-look media-gfx/gthumb x11-misc/spacefm gui-apps/waybar gui-apps/wofi media-fonts/fontawesome media-fonts/jetbrains-mono app-shells/fish media-fonts/dejavu app-misc/fastfetch app-misc/neofetch media-sound/pavucontrol gui-apps/hyprshot gui-apps/hyprlock app-editors/vim

doas mkdir -p /etc/iwd
echo "[General]" | doas tee /etc/iwd/main.conf
echo "EnableNetworkConfiguration=true" | doas tee -a /etc/iwd/main.conf
echo "[Network]" | doas tee -a /etc/iwd/main.conf
echo "NameResolvingService=resolvconf" | doas tee -a /etc/iwd/main.conf

echo "nameserver 8.8.8.8" | doas tee /etc/iwd/resolv.conf
echo "nameserver 8.8.4.4" | doas tee -a /etc/resolv.conf

echo "Installing vim plug..."
sleep 2
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Creating ~/Pictures and ~/Pictures/Wallpapers and ~/Pictures/Screenshots directories..."
mkdir -p ~/Pictures/Wallpapers
mkdir ~/Pictures/Screenshots
sleep 2

echo "Installing fish shell..."
chsh -s /bin/fish

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
doas cp -rf ~/Moga-Candy-Black/Moga-Candy-Black/ ~/.icons/

echo "Copying configs..."
sleep 2
cp ~/MyHyprConfigs/.vimrc ~/.vimrc
cp -rf ~/MyHyprConfigs/configs/* ~/.config/

echo ""
echo "Installer has finished its work."
read -p "Reboot? (y/n): " reboot_choice

if [[ "$reboot_choice" =~ ^[Yy]$ ]]; then
    echo "Rebooting..."
    doas reboot
else
    echo "Reboot skipped. Changes may require a restart to take effect."
fi
