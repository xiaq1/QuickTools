#!/bin/bash
    
cp BCLOUD used-BCOUD
git checkout BCLOUD 
#j=$(for i in `git diff | grep "+++" | awk  '{print $2}'`; do echo ${i#*/}; done); git commit -s $j $@
echo "test !fixup"
echo "ensure this is in a git repos"
user=$(git config --get user.name)
changed_file_list=$(for i in `git diff | grep "+++" | grep -v BCLOUD | awk  '{print $2}'`; do echo ${i#*/}; done)

echo "changed files list : $changed_file_list"
all_changed_file=$(echo $changed_file_list $@)

for i in $all_changed_file
do
    git add $i
done

for i in $all_changed_file
do
    sed -i 's/    /    /g' $i
done

latest_ciinfo=$(git log | grep -e "Author" -e "commit"  | head -n 2)
is_myci=$(echo $latest_ciinfo | grep $user)
if [[ $is_myci == "" ]]
then
    echo "This is the first local ci by $user recently"
    git commit -s $all_changed_file
else
    # step 1: git ci latest changes
	git commit --fixup=HEAD $all_changed_file
    # step 2: merge latest changes to last ci
    git rebase -i HEAD^^ --autosquash 
	git format-patch -1
fi
cp used-BCOUD BCLOUD 
