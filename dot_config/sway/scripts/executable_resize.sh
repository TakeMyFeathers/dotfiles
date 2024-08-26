#!/usr/bin/env bash

TEMP=$( getopt -o smlc --long small,medium,large,center -- "$@" ) || exit 

[ $? -eq 0 ] || { 
    echo "Incorrect options provided"
    exit 1
}

eval set -- "$TEMP"

while true; do
    case "$1" in
	-s | --small ) swaymsg resize set 1248px 756px;shift;;
	-m | --medium ) swaymsg resize set 1920px 1080px;shift;;
	-l | --large ) swaymsg resize set 1820px 1280px;shift;;
	-c | --center ) swaymsg move position center;shift;;
	--) shift;break;;
	*) break;;
    esac
done

