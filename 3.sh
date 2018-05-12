ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    hwclock --systohc
    pacman -S vim dialog wpa_supplicant ntfs-3g networkmanager net-tools
    echo "zh_CN.UTF-8 UTF-8\nen_US.UTF-8 UTF-8" > /etc/locale.gen
    locale-gen
    echo "LANG=en_US.UTF-8" > /etc/locale.conf
    echo "set you hostname: "
    read hostname
    vim /etc/$hostname
    echo "127.0.0.1 localhost.localdomain localhost\n::1 localhost.localdomain localhost\n127.0.1.1 $hostname.localdomain $hostname" > /etc/hosts
    passwd
    pacman -S intel-ucode
    pacman -S os-prober grub
    grub-install --target=i386-pc /dev/$disk-name
    grub-mkconfig -o /boot/grub/grub.cfg
    echo "you user name: "
    read username
    useradd -m -G wheel $username
    passwd $username
    visudo
echo "\n\n\n\n reboot"