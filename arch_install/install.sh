#!/bin/bash
pacman --needed -S - < packages-repo.txt
# su arch && cat packages-aur.txt | xargs yay -S --needed --noconfirm
# grub theme
cp -r Cyber-Security /boot/grub/themes/
mv /etc/default/grub /etc/default/grub.bak && cp grub /etc/default/
grub-mkconfig -o /boot/grub/grub.cfg
# nvidia-pacman hook
mkdir -p /etc/pacman.d/hooks/ && cp nvidia.hook /etc/pacman.d/hooks/ && mkinitcpio -P
cp xorg.conf /etc/X11/
# gdm nvidia-prime
cp optimus.desktop /usr/share/gdm/greeter/autostart/
cp optimus.desktop /etc/xdg/autostart/
systemctl enable gdm

# nvidia prime configuration
cp nvidia-drm-modeset.conf /etc/modprobe.d/
mv /etc/mkinitcpio.conf /etc/mkinitcpio.conf.bak && cp mkinitcpio.conf /etc/
mkinitcpio -P
# others
xdg-user-dirs-gtk-update
systemctl enable NetworkManager
mv /etc/environment /etc/environment.bak && cp environment /etc/
mv /etc/locale.gen /etc/locale.gen.bak && cp locale.gen /etc/ && locale-gen
