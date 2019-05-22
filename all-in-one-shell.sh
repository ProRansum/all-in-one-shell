#!/bin/bash
# ^ This piece defines that this current file is to use the bash.exe compiler stored in /bin/bash.exe* directory

### Ignore this Section #####
echo -e "\033[0m";
echo -e ")++++++++++++[+] \033[1;33mSample All in One Shell Script\033[0m [+]++++++++++++(";
echo -e ")+++++++++++++++++[+] \033[0;37mMade by:\033[0m \033[0;31mKevin Haas\033[0m [+]++++++++++++++++++( ";
echo -e ")++++++++++++++++++++[+] \033[0;32mHappy Bashing\033[0m! [+]++++++++++++++++++++(";
echo -e "\033[0m";
### End of Ignore ###########

### QUICK SAMPLE
FIRSTNAME="Kevin";
LASTNAME="Haas";
AGE=22;
PI=3.14159265358979323;
echo "# QUICK SAMPLE ";

echo "Hello! I'm your sample bash script!";
echo "I was made by ${FIRSTNAME} ${LASTNAME}, he's ${AGE}, and he likes ${PI}.";
echo "Oh... he's $AGE years old?? *GASP*"
echo "That's 1/$((100 / AGE)) a human life to 100 years old!";

echo "";
### END OF SAMPLE

# \
#  EASY
# /

### COMMENTS
# These are disregarded by the compiler, typically used to annotate your programs

### STORING VARIABLES
# > STRING
INT_0=2147483647;
INT_1=1000;
INT_2=23;

# > INTEGERS
STR="This is a String!";
FIRSTNAME="John";
LASTNAME="Doe";

# > DOUBLE\DECIMAL
PI=3.14159265358979323;

### USING STORED VARIABLES
# STRING
echo ""; # Padding for Output Readability
echo "# STRING SAMPLE";
echo "My name is $FIRSTNAME $LASTNAME.";

# INTEGERS
echo ""; # Padding for Output Readability
echo "# INTEGERS SAMPLE";
echo "Hey look a number! $INT_0."
echo "$INT_1 / $INT_2 = " $((INT_1 / INT_2));

# DOUBLE\DECIMAL
echo ""; # Padding for Output Readability
echo "# DOUBLE\DECIMAL SAMPLE";
echo "Hey look! Pi... $PI.";

# SHELL EXECUTIONS
echo ""
WORKING_DIRECTORY=$(pwd);
echo "We just ran 'pwd' and you didn't see it! Look: Working Directory is '${WORKING_DIRECTORY}'.";
echo "But we can also run it like... ";
echo "   ...this: $(pwd)";
echo "   ...this: `pwd`";

# \
#  SOME HARDER STUFF
# /

### CONDITIONAL STATEMENTS
echo "";
echo "# CONDITIONAL EXECUTIONS ";

# AND STATEMENTS
echo "# AND STATEMENTS";
echo "AND statements run BOTH, this one and " && echo "this one as well!";
## Though if one fails neither will execute...

# OR STATEMENTS
echo "";
echo "# OR STATEMENTS";
cat samples || echo "We failed to 'cat' a file 'samples', so we output this message!";
## Though if one passes the first it won't run the second and visa-versa to if the first one fails...
