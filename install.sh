cd
echo installing needed packages
sleep 2
sudo pacman -Syu gvim unzip hyprpicker noto-fonts-emoji noto-fonts noto-fonts-cjk nwg-look gthumb haruna imagemagick base-devel hyprland waybar wofi firefox thunar ttf-font-awesome otf-font-awesome ttf-jetbrains-mono fish pkgfile ttf-dejavu powerline-fonts inetutils fastfetch pavucontrol hyprshot hyprlock gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb udisks2 swww git
echo installing vim plug
sleep 2
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo creating ~/Pictures and ~/Pictures/Wallpapers and ~/Pictures/Screenshots directories
sleep 2
mkdir -p ~/Pictures/Wallpapers
mkdir ~/Pictures/Screenshots
echo copying wallpapers to ~/Pictures/Wallpapers/
sleep 2
cp ~/MyHyprConfigs/Wallpapers/* ~/Pictures/Wallpapers/
echo copying power menu and wallpaper changer to ~/
sleep 2
cp ~/MyHyprConfigs/wallpaper.sh ~/
cp ~/MyHyprConfigs/power-menu.sh ~/
chmod +x ~/power-menu.sh
chmod +x ~/wallpaper.sh
echo extracting the cursor theme
sleep 2
unzip ~/MyHyprConfigs/Moga-Candy-Black.zip
echo copying the cursor theme
sleep 2
sudo cp -rf ~/Moga-Candy-Black/Moga-Candy-Black /usr/share/icons/
sudo cp -rf ~/Moga-Candy-Black/Moga-Candy-Black ~/.local/share/icons/
echo copying configs
sleep 2
cp ~/MyHyprConfigs/.vimrc ~/.vimrc
cp -rf ~/MyHyprConfigs/configs/* ~/.config/
