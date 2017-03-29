#########################################################################
# File Name: cformat.sh
# Author: Qichao
# mail: qichao.xia@yours.com
# Created Time: Thursday, October 15, 2015 PM04:20:25 HKT
#########################################################################
#!/bin/bash
 for i in `find ./ -name "*.[ch]"`; do indent -i4 -linux $i; done
