# mooqita_challenge
1.  In order to create the random lines, I've used the built-in /dev/urandom feature, using only Latin Alphabet characters and numbers. 
 
2. To control the size of my file, I've used the while loop, making sure that the size of my file is less than 1MiB. 
To find the size of my file I/ve used two methods:
	-> wc -c < file
	-> stat --printf="%s" file

3.  To sort the file, I just used the sort command, with -o option. It sorts the file according to the first character of each line and it overwrites the file.

4. To remove the lines starting with "A" or "a", I've used the sed command & I've saved the output into a new file called changed_file.
	Then I've used again the command sed to remove blank lines, in-place this time.
	
5. To count the lines which were removed, I've used the diff command, combined with wc -l. 
