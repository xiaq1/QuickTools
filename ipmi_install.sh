#!/bin/bash

yum install ipmitool
yum install OpenIPMI.x86_64
yum install mcelog
yum install indent

cd /lib/modules/3.10.0-229.el7.x86_64/kernel/drivers/char/ipmi
modprobe ipmi_devintf
modprobe ipmi_si
modprobe ipmi_watchdog
modprobe ipmi_msghandler


