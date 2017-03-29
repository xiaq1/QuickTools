#########################################################################
# File Name: getlin.sh
# Author: Qichao
# mail: qichao.xia@yours.com
# Created Time: Thursday, October 15, 2015 PM04:20:15 HKT
#########################################################################
#!/bin/bash
cnt=0; for i in `find ./ -name "*.[ch]"`; do tmp=`wc -l $i | awk '{print $1}'`; echo "File $i: $tmp Line"; let cnt=cnt+tmp; done; echo "Total Line: $cnt";
