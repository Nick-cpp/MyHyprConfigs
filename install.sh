cd
echo installing needed packages
sleep 2
sudo pacman -Syu hyprpicker noto-fonts-emoji nwg-look gthumb haruna imagemagick base-devel hyprland waybar wofi firefox thunar ttf-font-awesome otf-font-awesome ttf-jetbrains-mono fish pkgfile ttf-dejavu powerline-fonts inetutils fastfetch pavucontrol hyprshot hyprlock micro gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb udisks2 swww git
echo creating ~/Pictures and ~/Pictures/Wallpapers and ~/Pictures/Screenshots directories
sleep 2
mkdir -p ~/Pictures/Wallpapers
mkdir ~/Pictures/Screenshots
echo copying wallpapers to ~/Pictures/Wallpapers/
sleep 2
cp -rf ~/MyHyprConfigs/Wallpapers ~/Pictures/Wallpapers/
echo copying power and network menus to ~/
sleep 2
cp ~/MyHyprConfigs/power-menu.sh ~/
cp ~/MyHyprConfigs/network-menu.sh ~/
echo copying the cursor theme
sleep 2
sudo cp -rf ~/MyHyprConfigs/Moga-Candy-Black/ /usr/share/icons/
chmod +x ~/power-menu.sh
chmod +x ~/network-menu.sh
echo copying configs
sleep 2
cp -rf ~/MyHyprConfigs/configs/* ~/.config/
