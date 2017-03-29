#########################################################################
# File Name: style.sh
# Author: Qichao
# mail: qichao.xia@yours.com
# Created Time: Wednesday, February 03, 2016 PM12:25:41 HKT
#########################################################################
#!/bin/bash

#KRSTYLE="-kr -l85 -hnl -nbbo -br -ce -cdw -ci4 -i4 -bli4 -ts4"
#KRSTYLE="-kr -l85 -hnl -nbbo -br -ce -cdw -ci4 -cli4 -i4 -bli4 -ts4 -nip -bad -bap -ppi3 -nbc -di8"
KRSTYLE="-kr -l85 -hnl -nbbo -br -ce -cdw -ci0 -cli4 -i4 -bli4 -ts0 -nip -bad -bap -ppi0 -nbc -di4"

indent $KRSTYLE $1;
