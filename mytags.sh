#########################################################################
# File Name: mytags.sh
# Author: xxxxx
# mail: xxxxx.xxx@yours.com
# Created Time: Fri 17 Mar 2017 10:01:10 AM CST
#########################################################################
#!/bin/bash

#find . -type f -name "*.h" -o -name "*.c"-o -name "*.cc" | tee cscope.files
rm -rf  cscope*
rm -rf tags
cscope -bRk
find . -type f -name "*.h" -o -name "*.c"-o -name "*.cc" > cscope.files
#cscope -bRk -i cscope.files
#cscope -bqk -i cscope.files
#ctags -R -L cscope.files
ctags -R -L cscope.files
