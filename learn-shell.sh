#!/bin/bash
# You can also use other interpreters like /usr/bin/python
# If you want the new shell to be executed, you should give it the execution authority
# The command is "chmod +x learn-shell.sh" 

############################################################################################
# Basic bash commands:
# echo      display string or variables
# file      determine file type
# ls        list directory contents
# ll        list directory contents with long listing format
# ls -a     list directory contents without ignoring files start with "."
# chmod     change mode for file permission, + for adding, - for removing, = for setting
# mkdir     make directories
# rm        remove files
# rm -r     recursively remove files, often use when removing directories
# rm -f     forcely remove files
# cp        copy files
# cp -r     copy directories
# mv        move files
# cat       concatenate files and print all contents
# more      print one screenful contents
# less      similar to more
# head -n   print contents with a certain number of lines at the beginning of file
# tail -n   print contents with a certain number of lines at the end of file
# tail -f   monitoring appending contents
# grep      search and print the contents with the keyword in the file 
# ps        report a snapshot of the current processes
# ps aux    report every current processes on the system using BSD syntax
# kill      kill process with pid

# Pipe operator: |
# The output of the first command is piped to the second command as its input.

# Output redirect operator: > and >>
# The > overwrites the file if it exists or creates it if it doesn't exist.
# The >> appends to a file or creates the file if it doesn't exist.
############################################################################################

foo=123  # no space between '='

echo $foo  # dollar sign for accessing variables
echo ${foo}bar  # braces for solving ambiguity in expression

if [ 10 -eq 20 ]  # two spaces between the content inside the []
then echo 10 is equal to 20 
elif [ 10 -lt 20 ]  # else if  
then echo 10 is less than 20
else echo 10 is larger than 20
fi  # end if
 
# -eq   equal
# -ne   not equal
# -gt   greater than
# -ge   greater or equal
# -lt   less than
# -le   less or equal

i=0
while [ $i -lt 10 ]  # while loop
do  # begin command
    echo i = $i
    i=$(($i + 1))  # Use two pairs of parentheses inside dollar sign for expression
    i=`expr $i + 1`  # Using `` and expr is equivalent to using $(())
    # When using 'expr', there must be spaces between operators
    # Execute command inside `` first and replace `command...` as its output
done  # end while

for var in 0 1 2 3 4 5  # for loop
do  
    echo $var  # print 0 to 5
done  # end for

function_name() {  # Use parentheses to declare a function, cannot use parameters inside
    echo I am a function
}

function function_with_params {  # Explicitly declare a function, no parentheses
    echo hello $1, $2  # Use dollar signs for params
} # Function should be pre-defined before calling

function_with_params sun moon  # calling function

lines_in_text () {
    cat $1 | wc -l 
}
num_lines=`lines_in_text $1`  # use the argument of the calling command in terminal 
echo The file $1 has $num_lines lines in it.

# To be continue
