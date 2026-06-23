```bash
#! /bin/bash

# ECHO COMMAND
echo Hello World!

# VARIABLES
Uppercase by convention
Letters, numbers, underscores allowed

NAME="Brad"
echo "My name is $NAME"

# USER INPUT
read -p "Enter your name: " NAME2
echo "Hello $NAME2, nice to meet you"

# CONDITIONALS
if [ "$NAME2" == "Mikael" ]
then
    echo "Your name is Mikael"
elif [ "$NAME2" == "Line" ]
then
    echo "Your name is Line"
else
    echo "Your name isn't Mikael nor Line"
fi

# COMPARISON
-eq =
-ne !=
-gt >
-ge >=
-lt <
-le <=

NUM1=1
NUM2=2
if [ "$NUM1" -le "$NUM2" ]
then
    echo "$NUM1 is less than or equal to $NUM2"
fi

FILE="text.txt"
if [ -e "$FILE" ]
then
    echo "$FILE does not exist"
elif [ -f "$FILE" ]
then
    echo "$FILE is a file"
else
    echo "$FILE is not a file"
fi

-d file   True if the file is a directory
-e file   True if the file exists (note that this is not particularly portable, thus -f is generally used)
-f file   True if the provided string is a file
-g file   True if the group id is set on a file
-r file   True if the file is readable
-s file   True if the file has a non-zero size
-u    True if the user id is set on a file
-w    True if the file is writable
-x    True if the file is an executable

#CASE STATEMENT
read -p "Are you 21 or over? Y/N " ANSWER
case "$ANSWER" in
    [yY] | [yY][eE][sS])
        echo "you can have a beer!"
        ;;
    [nN] | [nN][oO])
        echo "Sorry dudeeee"
        ;;
    *)
        echo "Please enter y/yes or n/no"
        ;;
esac

# SIMPLE FOR LOOP
NAMES="Brad Kevin Alice Mark"
for NAME in $NAMES
    do
        echo "Hello $NAME"
done

# FOR LOOP RENAME FILES
FILES=$(ls *.txt)
NEW="new"
for FILE in $FILES
    do
        echo "Renaming $FILE to new-$FILE"
        mv $FILE $NEW-$FILE
done

# WHILE LOOP - READ THROUGH A FILE LINE BY LINE
LINE=1
while read -r CURRENT_LINE
    do
        echo "$LINE: $CURRENT_LINE"
        ((LINE++))
done < "./new-1.txt"

# FUNCTION
function sayHello() {
    echo "Hello World"
}

sayHello

# FUNCTION WITH PARAMS
function greet() {
    echo "Hello, I am $1 and I am $2"
}

greet "Brad" "26"
```
