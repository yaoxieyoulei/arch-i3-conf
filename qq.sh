Verify-network()
{
    ping -c 3 -w 5 www.baidu.com
    clear
    if [[ $? != 0 ]];then
        echo -e "\e[1;31mERROR : can not connect to network"
        sleep 1s
        exit -1
    else
        echo "network is available"
    fi

    echo -e "\e[1;32mDone == Verify network"
    sleep 1s
}


Verify-boot-mode()
{
    if [[ -d /sys/firmware/efi/efivars ]]; then
        echo "You system are UEFI mode"
        boot-mode = uefi
    else
        echo "You system are BIOS mode"
        boot-mode = bios
    fi
    echo -e "\e[1;32mDone == Verify boot mode"
    sleep 1s
}

Update-the-system-clock()
{
    timedatectl set-ntp true
    timedatectl status
    echo -e "\e[1;32mDone == Update the system clock"
    sleep 1s
}


Set-disk-UEFI()
{
    echo "You disk info"
    fdisk -l
    echo "which disk do you want to set: "
    read disk-name
    echo "Is this disk new (y/n): "
    read flag
    if [ "$flag" == "y" || "$flag" == "" ];
        then
            disk-new="o"
        else
    fi

}

Set-disk-BIOS()
{
    fdisk /dev/$disk-name
    mkfs.ext4 /dev/sdxY
}

Mount-disk()
{
    mount /dev/sdxY /mnt
}


arch-install()
{
    echo "Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch\nServer = http://mirrors.zju.edu.cn/archlinux/$repo/os/$arch" > /etc/pacman.d/mirrorlist
    pacstrap /mnt base base-devel
    genfstab -L /mnt >> /mnt/etc/fstab
    cat /mnt/etc/fstab
    arch-chroot /mnt
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
    exit
    reboot
}

arch-i3()
{
    sudo pacman -S xf86-video-intel
    sudo pacman -S alsa-utils xf86-video-vesa xorg xorg-xinit
    sudo pacman -S zsh git unrar zip unzip openssh glances htop iftop neofetch tree mpv mpd mpc wget lolcat cmatrix


}






