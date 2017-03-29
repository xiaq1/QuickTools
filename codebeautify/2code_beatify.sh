#!/bin/bash


#NETPARA="-bad -bap -bbb -bbo -nbc -bl -bli0 -bls -c33 -cd33 -ncdb -ncdw -nce -cli0 -cp33 -cs -d0 -nbfda -nfc1 -nfca -hnl -ip5 -l75 -lp -pcs -nprs -saf -sai -saw -nsc -nsob -nss -i4 -ts4 -ut"
NETPARA="-bad -bap -bbb -bbo -bl -bli0 -bls -c33 -cd33 -ncdb -ncdw -nce -cli0 -cp33 -cs -d0 -nbfda -nfc1 -nfca -hnl -ip5 -l75 -lp -pcs -nprs -saf -sai -saw -nsc -nsob -nss -i4 -ts4 -ut"
#LNXSTYLE="-npro -kr -i4 -bli4 -ts4 -sob -l85 -ss -ncs -cp1"
#KRSTYLE="-npro -kr -i4 -bli4 -ts4 -sob -l85 -ss -ncs -cp1"
#KRSTYLE="-kr -l85"
KRSTYLE="-kr -l85 -hnl -nbbo"
LNXSTYLE="-linux -ci4 -i4 -bli4 -ts4"
for i in `find ./ -name "*.[ch]"`
do
#indent $NETPARA $i;
	#indent $LNXSTYLE $i;
	indent $KRSTYLE $i;
done
