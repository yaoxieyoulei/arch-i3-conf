echo "Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch\nServer = http://mirrors.zju.edu.cn/archlinux/$repo/os/$arch" > /etc/pacman.d/mirrorlist
    pacstrap /mnt base base-devel
    genfstab -L /mnt >> /mnt/etc/fstab
    cat /mnt/etc/fstab
echo "\n\n\n\nchange root"