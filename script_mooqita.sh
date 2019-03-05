#!/bin/bash

# https://app.mooqita.org/app/solution?challenge_id=YKgnjCTtuD2AoAmu2

file="/root/Desktop/scripts/mooqita_challenge/fisier_random"
changed_file="/root/Desktop/scripts/mooqita_challenge/changed_file"

if [ -f $file ] ; then
    rm $file
fi

size=0

# size=$(stat --printf="%s" "$file")
# !Mib = 1048576 bytes

# Create random lines until the file reaches the size of 1MiB
while [ $size -lt $((1048576 - 15)) ]
do
	head /dev/urandom | tr -dc A-Za-z0-9 | head -c 15 >> fisier_random
	echo "" >> fisier_random
	size=$(wc -c < "$file")
done

# echo $(wc -c < "$file")
# echo  "var2 -  $(stat --printf="%s" "$file")"

# cat $file

# Sort the file
sort -o $file $file

# echo "sorted:"
# echo "$(cat $file)"

# Remove the lines that start with "a" or "A" & save the result into a new file
sed -e 's/A.*//g' -e 's/a.*//g' $file > $changed_file

# Remove in-place blank lines
sed -i '/^[[:space:]]*$/d' $changed_file

# cat $file

# No of lines removed:
original=$(wc -l < "$file")
changed=$(wc -l < "$changed_file")
echo "Lines removed: $(($original - $changed))" 
