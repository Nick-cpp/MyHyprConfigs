cd
echo installing needed packages
sleep 2
sudo pacman -Syu nwg-look gthumb haruna imagemagick base-devel hyprland waybar wofi firefox thunar ttf-font-awesome otf-font-awesome ttf-jetbrains-mono fish pkgfile ttf-dejavu powerline-fonts inetutils fastfetch pavucontrol hyprshot hyprlock micro gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb udisks2 swww git

git clone https://github.com/Nick-cpp/MyHyprConfigs
echo creating ~/Pictures and ~/Pictures/Wallpapers directories
sleep 2
mkdir ~/Pictures
mkdir ~/Pictures/Wallpapers
echo copying wallpapers to ~/Pictures/Wallpapers/
sleep 2
cp -rf ~/MyHyprConfigs/Wallpapers ~/Pictures/Wallpapers/
echo copying power menu to ~/
sleep 2
cp ~/MyHyprConfigs/power-menu.sh ~/
echo copying the cursor theme
sleep 2
sudo cp -rf ~/MyHyprConfigs/Mogo-Candy-Black/ /usr/share/icons/
chmod +x ~/power-menu.sh
echo copying configs
sleep 2
cp -rf ~/MyHyprConfigs/configs/* ~/.config/
