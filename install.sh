cd
sudo pacman -Syu nwg-look gthumb haruna imagemagick base-devel hyprland waybar wofi firefox thunar ttf-font-awesome otf-font-awesome ttf-jetbrains-mono fish pkgfile ttf-dejavu powerline-fonts inetutils fastfetch pavucontrol hyprshot hyprlock micro gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb udisks2 swww git

git clone https://github.com/Nick-cpp/MyHyprConfigs

mkdir ~/Pictures
mkdir ~/Pictures/Wallpapers
sleep 1
cp -rf ~/MyHyprConfigs/Wallpapers ~/Pictures/Wallpapers/
sleep 1
cp ~/MyHyprConfigs/power-menu.sh ~/
sleep 1
sudo cp -rf ~/MyHyprConfigs/Mogo-Candy-Black/ /usr/share/icons/
sleep 1
chmod +x ~/power-menu.sh
sleep 2
cp -rf ~/MyHyprConfigs/configs/* ~/.config/
