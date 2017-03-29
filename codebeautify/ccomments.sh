#!/bin/bash

lastinc="#include";
lastdef="#define"
endpatern="#endif"

tab=" "
file=$1
sedtg="\'";

patern1="\n#ifdef${tab}__cplusplus\nextern \"C\" {\n#endif\n";
patern2="\n#ifdef __cplusplus\n}\n#endif\n";


# step 0: Remove unless // comments for reduant code
#sed -e '/^[\t| ]*\/\//d' $1
sed -i '/^[\t| ]*\/\//d' $1

# step 0.5: Skip if "extern "C"" already exist in HEADER FILE
filename=$1;
# echo "File name and type: ${filename} ${filename:0-1:1}" 
[[ ${filename:0-1:1} != "h" ]] && exit; 
#echo "This is header file"

grep -n "extern \"C\"" $1 >> /dev/null
[[ $? -eq 0 ]] && exit

# step 1: add "exter "C" {"
Cline=$(grep -n $lastinc $file | awk -F : '{print $1}' | tail -n 1)
if [[ $Cline -eq 0 ]]
then
	Cline=$(grep -n $lastdef $file | awk -F : '{print $1}' | head -n 1)
fi
let Cline=Cline+1;
#echo "Cline number: $Cline";
sed -i "${Cline}i \\${patern1}" $1


#step 2:  add "}"
endline=$(grep -n $endpatern $file | awk -F : '{print $1}' | tail -n 1);
let endline=endline-1;
#echo "endline number: $endline";
sed -i "${endline}i \\${patern2}" $1


## step 3: add /* __FILE_H */ to end of last line
## 3.1 get __FILE_H
annotation=$(grep -n "#ifndef" $1 | head -n 1 | awk '{print $2}');
#echo "annoation = $annotation"

## 3.2 find line number of last "#endif"
endline=$(grep -n $endpatern $file | awk -F : '{print $1}' | tail -n 1);
#echo "endline = ${endline}"

## 3.3 add annoation to end of last line with "#endif"
sed -i "${endline}s/$/\ \/\* ${annotation} \*\//" $1

