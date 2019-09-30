#bin/bash
echo "******* Getting theme packages installed now: *******" && sleep 6
sudo pacman -S arc-gtk-theme arc-x-icons-theme --noconfirm --needed
echo "******* setting up theme for Light-DM: *******" && sleep 6
wget https://raw.githubusercontent.com/endeavouros-team/EndeavourOS-archiso/master/airootfs/etc/lightdm/lightdm-gtk-greeter.conf
sudo cp lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
rm lightdm-gtk-greeter.conf
echo "******* cloning dotfiles for EndeavourOS - Cinnamon Theming *******" && sleep 6
git clone https://github.com/r2d2-joe/dotfiles.git
cd dotfiles
sudo cp -R endeavouros /usr/share/endeavouros
rm -R ~/.config ~/.cinnamon ~/.fontconfig ~/icons
cp -R CINNAMON/. ~/
dconf load ~/ <cinnamon.dconf
cd ~/
echo "******* All Done --- restarting Desktop Manager *******" && sleep 6
echo "******* Please login again and enjoy EndeavourOS Theming! *******" && sleep 6
sudo systemctl restart lightdm
