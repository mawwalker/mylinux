#!/bin/bash
pacman -S iw wpa_supplicant dialog grub efibootmgr os-prober
# useradd -m -g users -s /bin/bash dsm
# chmod u+w /etc/sudoers
# echo 'dsm ALL=(ALL) ALL' >> /etc/sudoers
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc
echo Archlinux > /etc/hostname
systemctl enable dhcpcd
grub-install --efi-directory=/boot/efi --bootloader-id=Archlinux
grub-mkconfig -o /boot/grub/grub.cfg
mv /etc/pacman.conf /etc/pacman.conf.bak
cp pacman.conf /etc/
pacman -Syy && pacman -S archlinuxcn-keyring --noconfirm
