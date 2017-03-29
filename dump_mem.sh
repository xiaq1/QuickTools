#!/bin/bash
free -m >> $1
cat /proc/iomem >> $1
cat /proc/ioports >> $1
lspci -vvvvvv >> $1
dmesg >> $1

