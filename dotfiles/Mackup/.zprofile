#[ ! -s ~/.config/mpd/pid ] && mpd
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
export LFS=/mnt/lfs
