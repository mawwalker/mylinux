#!/bin/bash
# pacman --needed -S - < packages-repo.txt
# su arch && cat packages-aur.txt | xargs yay -S --needed --noconfirm
# grub theme
cp -r Cyber-Security /boot/grub/themes/
mv /etc/default/grub /etc/default/grub.bak && cp grub /etc/default/
grub-mkconfig -o /boot/grub/grub.cfg
# nvidia-pacman hook
mkdir -p /etc/pacman.d/hooks/ && cp nvidia.hook /etc/pacman.d/hooks/ && mkinitcpio -P
cp xorg.conf /etc/X11/

# lightdm nvidia-prime
# cp display_setup.sh /etc/lightdm/display_setup.sh 
# chmod +x /etc/lightdm/display_setup.sh
# mv /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.bak
# cp lightdm.conf /etc/lightdm/lightdm.conf
# systemctl enable lightdm

# nvidia prime configuration
cp nvidia-drm-modeset.conf /etc/modprobe.d/
mv /etc/mkinitcpio.conf /etc/mkinitcpio.conf.bak && cp mkinitcpio.conf /etc/
mkinitcpio -P
# others
xdg-user-dirs-gtk-update
systemctl enable NetworkManager
mv /etc/environment /etc/environment.bak && cp environment /etc/
mv /etc/locale.gen /etc/locale.gen.bak && cp locale.gen /etc/ && locale-gen
