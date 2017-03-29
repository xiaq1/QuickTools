#!/bin/bash

for i in `find $1 -name "*.[ch]"`
do
#indent $NETPARA $i;
	#indent $LNXSTYLE $i;
	./style.sh $i;
	./ccomments.sh $i;
done

#./gitcommit.sh
