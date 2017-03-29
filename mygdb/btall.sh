#########################################################################
# File Name: btall.sh
# Author: xxxxx
# mail: xxxxx.xxx@yours.com
# Created Time: Thu 22 Dec 2016 02:49:50 AM EST
#########################################################################
#!/bin/bash

gdb -q --batch --ex "thread apply all bt" -p `pidof $1` 2>&1 | tee mytest-$1.bt
#gdb -q --batch --ex "print *sts" -p `pidof $1` 2>&1 | tee -a mytest-$1.bt
gdb -q --batch --ex "print pool_use_nvdimm_enable" -p `pidof my-fuse` 2>&1 | tee -a zfs-$1.bt
gdb -q --batch --ex "print my_nvm" -p `pidof my-fuse` 2>&1 | tee -a zfs-$1.bt
