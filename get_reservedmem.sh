#########################################################################
# File Name: get_reservedmem.sh
# Author: Qichao
# mail: qichao.xia@yours.com
# Created Time: Monday, December 28, 2015 PM04:26:16 HKT
#########################################################################
#!/bin/bash
cat /proc/cmdline | grep -o "mem=[0-9]*[KMGTE]"
