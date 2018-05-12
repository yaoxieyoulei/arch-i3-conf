
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


    if [[ -d /sys/firmware/efi/efivars ]]; then
        echo "You system are UEFI mode"
        boot-mode = uefi
    else
        echo "You system are BIOS mode"
        boot-mode = bios
    fi
    echo -e "\e[1;32mDone == Verify boot mode"
    sleep 1s



    timedatectl set-ntp true
    timedatectl status
    echo -e "\e[1;32mDone == Update the system clock"
    sleep 1s
