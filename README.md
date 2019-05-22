# all-in-one-shell
A easily referencable script to help accelerate script building for those whom veer on the side of the easily forgetful on the small things.

### Source Script
To view the source script which should provide all of the below code all in one executable program

Check out here - [\*/master/*__all-in-one-shell.sh__*](https://github.com/ProRansum/all-in-one-shell/blob/master/all-in-one-shell.sh)

## SAMPLE SCRIPT
``` shell
#!/usr/bin/env bash

FIRSTNAME="John";
LASTNAME="Doe";
AGE=22;
PI=3.14159265358979323;

echo "Hello! I'm your sample bash script!";
echo "I was made by ${FIRSTNAME} ${LASTNAME}, he's ${AGE}, and he likes ${PI}.";
echo "Oh... he's $AGE years old?? *GASP*"
echo "That's 1/$((100 / AGE)) a human life to 100 years old!";

```

---
# [INTRODUCTION](#introduction)

## __Setting Variables__
### _String_
``` shell
# Set the Value
STRING="I'm a String Value!";

# Output the Value
echo $STRING;
```
```
I'm a String Value!
```

### _Integers\\Numbers_
``` shell
# Set the Value
NUMBER=2147483647;

# Output the Value
echo $NUMBER;
```
```
2147483647
```

### _Decimals\\Doubles_
``` shell
# Set the Value
PI=3.14159265358979323;

# Output the Value
echo $PI;
```
```
3.14159265358979323
```

### _Calling All In Same Output_
``` shell
# Set the Value
STRING="I'm a String Value";
NUMBER=2147483647;
PI=3.14159265358979323;

# Output the Value
echo "$STRING, Here's a Number: $NUMBER, and Here's a Decimal: $PI.";
```
```
I'm a String Value, Here's a Number: 2147483647, and Here's a Decimal: 3.14159265358979323.
```

# [ADVANCED](#advanced)

## Functions
``` shell
get_name() {
  echo "Bob"
}

echo "You are $(get_name).";
```
```
You are Bob.
```

## Conditionals
``` shell
if [[ -z "$string" ]]; then
  echo "String is empty"
elif [[ -n "$string" ]]; then
  echo "String is not empty"
fi
```

## Strict mode
``` shell
set -euo pipefail
IFS=$'\n\t'
```

## Brace expansion
``` shell
echo {A,B}.js
{A,B}	Same as A B
{A,B}.js	Same as A.js B.js
{1..5}	Same as 1 2 3 4 5
```

# Parameter expansions

## _Basics_

``` shell
name="John"
echo ${name}
echo ${name/J/j}      #=> "john" (substitution)
echo ${name:0:2}      #=> "Jo" (slicing)
echo ${name::2}       #=> "Jo" (slicing)
echo ${name::-1}      #=> "Joh" (slicing)
echo ${name:(-1)}     #=> "n" (slicing from right)
echo ${name:(-2):1}   #=> "h" (slicing from right)
echo ${food:-Cake}    #=> $food or "Cake"
length=2
echo ${name:0:length} #=> "Jo"

STR="/path/to/foo.cpp"
echo ${STR%.cpp}      # /path/to/foo
echo ${STR%.cpp}.o    # /path/to/foo.o

echo ${STR##*.}       # cpp (extension)
echo ${STR##*/}       # foo.cpp (basepath)

echo ${STR#*/}        # path/to/foo.cpp
echo ${STR##*/}       # foo.cpp

echo ${STR/foo/bar}   # /path/to/bar.cpp

STR="Hello world"
echo ${STR:6:5}       # "world"
echo ${STR:-5:5}      # "world"

SRC="/path/to/foo.cpp"
BASE=${SRC##*/}       #=> "foo.cpp" (basepath)
DIR=${SRC%$BASE}      #=> "/path/to/" (dirpath)
```

## _Substitution_
- `${FOO%suffix}`   - Remove suffix
- `${FOO#prefix}`   - Remove prefix
- `${FOO%%suffix}`  - Remove long suffix
- `${FOO##prefix}`  - Remove long prefix
- `${FOO/from/to}`  - Replace first match
- `${FOO//from/to}` - Replace all
- `${FOO/%from/to}` - Replace suffix
- `${FOO/#from/to}` - Replace prefix

## Comments
``` shell
# Single line comment
: '
This is a
multi line
comment
'
```

## Substrings
```
${FOO:0:3}	Substring (position, length)
${FOO:-3:3}	Substring from the right
```

## Length
```
${#FOO}	Length of $FOO
```

## Default values
```
${FOO:-val}	$FOO, or val if not set
${FOO:=val}	Set $FOO to val if not set
${FOO:+val}	val if $FOO is set
${FOO:?message}	Show error message and exit if $FOO is not set
```

> The `:` is optional, i.e. `${FOO=word}` works as well!

## Loops

#### _Basic for loop_

``` shell
for i in /etc/rc.*; do
  echo $i
done
```
```
sample_output
```

#### _C-like FOR Loop_
``` shell
for ((i = 0 ; i < 100 ; i++)); do
  echo $i
done
```
```
sample_output
```

#### _Number Ranges_
``` shell
for i in {1..5}; do
    echo "Welcome $i"
done
```
```
Welcome 1
Welcome 2
Welcome 3
Welcome 4
Welcome 5
```

#### _With step size_
``` shell
for i in {5..50..5}; do
    echo "Welcome $i"
done
```
```
sample_output
```

#### _Reading lines_
``` shell
< file.txt | while read line; do
  echo $line
done
```
```
sample_output
```

#### _Infinite Loop_
``` shell
while true; do
done
```
```
sample_output
```

## Functions

#### _Defining a Function_
``` shell
myfunc() {
    echo "hello $1"
}
```
```
sample_output
```

# Same as above (alternate syntax)

#### _Same as Above_
``` shell
function myfunc() {
    echo "hello $1"
}
myfunc "John"
```
```
sample_output
```


#### _Returning values_
``` shell
myfunc() {
    local myresult='some value'
    echo $myresult
}
result="$(myfunc)"
```
```
sample_output
```

#### _Raising errors_
``` shell
myfunc() {
  return 1
}
if myfunc; then
  echo "success"
else
  echo "failure"
fi
```
```
sample_output
```

Arguments
- `$#` - Number of arguments
- `$*` - All arguments
- `$@` - All arguments, starting from first
- `$1` - First argument

## Conditionals

### Regular Conditions

> Note that [[ is actually a command/program that returns either 0 (true) or 1 (false). <br />
> Any program that obeys the same logic (like all base utils, such as grep(1) or ping(1)) can be used as condition. <br />
> _See below for provided examples..._

- `[[ -z STRING ]]` - Empty string
- `[[ -n STRING ]]` - Not empty string
- `[[ STRING == STRING ]]` - Equal
- `[[ STRING != STRING ]]` - Not Equal
- `[[ NUM -eq NUM ]]` - Equal
- `[[ NUM -ne NUM ]]` - Not equal
- `[[ NUM -lt NUM ]]` - Less than
- `[[ NUM -le NUM ]]` - Less than or equal
- `[[ NUM -gt NUM ]]` - Greater than
- `[[ NUM -ge NUM ]]` - Greater than or equal
- `[[ STRING =~ STRING ]]` - Regexp
- `(( NUM < NUM ))` - Numeric conditions
- `[[ -o noclobber ]]` - If OPTIONNAME is enabled
- `[[ ! EXPR ]]` - Not
- `[[ X ]] && [[ Y ]]` - And
- `[[ X ]] || [[ Y ]]` - Or

### File Conditions
- `[[ -e FILE ]]` - Exists
- `[[ -r FILE ]]` - Readable
- `[[ -h FILE ]]` - Symlink
- `[[ -d FILE ]]` - Directory
- `[[ -w FILE ]]` - Writable
- `[[ -s FILE ]]` - Size is > 0 bytes
- `[[ -f FILE ]]` - File
- `[[ -x FILE ]]` - Executable
- `[[ FILE1 -nt FILE2 ]]` - 1 is more recent than 2
- `[[ FILE1 -ot FILE2 ]]` - 2 is more recent than 1
- `[[ FILE1 -ef FILE2 ]]` - Same files

#### Here's some Examples...
``` shell
#!/bin/bash

if ping -c 1 google.com; then
    echo "Connection to google is passing, you have a successful internet connection!";
fi

if grep -q 'foo' ~/.bash_history; then
    echo "Hmm... Looks like you've typed 'foo' before. I'm concerned, but that's okay!";
fi

# Using String Values
if [[ -z "$string" ]]; then
    echo "Uh-oh! Looks like the variable 'string' is empty...";
elif [[ -n "$string" ]]; then
    echo "Well hey, looks like the variable 'string' is not empty, it shows '$string'.";
fi

# Using Combinations
if [[ X ]] && [[ Y ]]; then
    echo "Passed: '[[ X ]] && [[ Y ]]'.";
fi

# Using Equal Values
if [[ "$A" == "$B" ]]
    echo "'$A' == '$B'";
fi

# Using Regex
if [[ "A" =~ "." ]]

if (( $a < $b )); then
    echo "$a is LESS THAN the value $b"
fi

if [[ -e "file.txt" ]]; then
    echo "File Exists"
fi
```

## Arrays

### _Defining Arrays_
``` shell
Fruits=('Apple' 'Banana' 'Orange')
Fruits[0]="Apple"
Fruits[1]="Banana"
Fruits[2]="Orange"
```

### _Working with Arrays_
``` shell 
echo ${Fruits[0]}           # Element #0
echo ${Fruits[@]}           # All elements, space-separated
echo ${#Fruits[@]}          # Number of elements
echo ${#Fruits}             # String length of the 1st element
echo ${#Fruits[3]}          # String length of the Nth element
echo ${Fruits[@]:3:2}       # Range (from position 3, length 2)
```
```
sample_output
```

### _Operations_
``` shell
Fruits=("${Fruits[@]}" "Watermelon")    # Push
Fruits+=('Watermelon')                  # Also Push
Fruits=( ${Fruits[@]/Ap*/} )            # Remove by regex match
unset Fruits[2]                         # Remove one item
Fruits=("${Fruits[@]}")                 # Duplicate
Fruits=("${Fruits[@]}" "${Veggies[@]}") # Concatenate
lines=(`cat "logfile"`)                 # Read from file
```
### _Iteration_
``` shell
for i in "${arrayName[@]}"; do
	echo $i
done
```
```
sample_output
```

## Dictionaries

### _Defining_
``` shell 
declare -A sounds
sounds[dog]="bark"
sounds[cow]="moo"
sounds[bird]="tweet"
sounds[wolf]="howl"
```

> Declares sound as a Dictionary object... i.e. associative array.

### _Working with dictionaries_
``` shell 
echo ${sounds[dog]} # Dog's sound
echo ${sounds[@]}   # All values
echo ${!sounds[@]}  # All keys
echo ${#sounds[@]}  # Number of elements
unset sounds[dog]   # Delete dog
```
```
sample_output
```

### _Iteration_
``` shell
# Iterate over values
for val in "${sounds[@]}"; do
  echo $val
done

# Iterate over keys
for key in "${!sounds[@]}"; do
  echo $key
done
```
```
sample_output
```

## Options
### _Options_
``` shell 
set -o noclobber  # Avoid overlay files (echo "hi" > foo)
set -o errexit    # Used to exit upon error, avoiding cascading errors
set -o pipefail   # Unveils hidden failures
set -o nounset    # Exposes unset variables
```

### _Global Options_
``` shell
set -o nullglob    # Non-matching globs are removed  ('*.foo' => '')
set -o failglob    # Non-matching globs throw errors
set -o nocaseglob  # Case insensitive globs
set -o globdots    # Wildcards match dotfiles ("*.sh" => ".foo.sh")
set -o globstar    # Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')
```

> Set `GLOBIGNORE` as a colon-separated list of patterns to be removed from glob matches.

## History

### _Commands_
- `history` - Show history
- `shopt -s histverify` - Don’t execute expanded result immediately


### _Expansions_
- `!$`  - Expand last parameter of most recent command
- `!*`  - Expand all parameters of most recent command
- `!-n` - Expand nth most recent command
- `!n`  - Expand nth command in history
- `!<command>` - Expand most recent invocation of command <command>

### _Operations_
- `!!`   - Execute last command again
- `!!:s/<FROM>/<TO>/` - Replace first occurrence of <FROM> to <TO> in most recent command
- `!!:gs/<FROM>/<TO>/` - Replace all occurrences of <FROM> to <TO> in most recent command
- `!$:t` - Expand only basename from last parameter of most recent command
- `!$:h` - Expand only directory from last parameter of most recent command
- `!!`   - and !$ can be replaced with any valid expansion.

### _Slices_
- `!!:n` - Expand only nth token from most recent command (command is 0; first argument is 1)
- `!^` - Expand first argument from most recent command
- `!$` - Expand last token from most recent command
- `!!:n-m` - Expand range of tokens from most recent command
- `!!:n-$` - Expand nth token to last from most recent command
- `!!` - can be replaced with any valid expansion i.e. !cat, !-2, !42, etc.

## Miscellaneous

### _Numeric Calculations_
``` shell 
$((a + 200))      # Add 200 to $a
$((RANDOM%=200))  # Random number 0..200
```

### _Sub-shells_
(cd somedir; echo "I'm now in $PWD")
``` shell 
pwd # still in first directory
Redirection
python hello.py > output.txt   # stdout to (file)
python hello.py >> output.txt  # stdout to (file), append
python hello.py 2> error.log   # stderr to (file)
python hello.py 2>&1           # stderr to stdout
python hello.py 2>/dev/null    # stderr to (null)
python hello.py &>/dev/null    # stdout and stderr to (null)
python hello.py < foo.txt      # feed foo.txt to stdin for python
```

### _Inspecting Commands_
``` shell
command -V cd #=> "cd is a function/alias/whatever"
```

### _Catch Errors_
``` shell 
trap 'echo Error at about $LINENO' ERR
```

> or

``` shell 
traperr() {
  echo "ERROR: ${BASH_SOURCE[1]} at about ${BASH_LINENO[0]}"
}

set -o errtrace
trap traperr ERR
Case/switch
case "$1" in
  start | up)
    vagrant up
    ;;

  *)
    echo "Usage: $0 {start|stop|ssh}"
    ;;
esac
```

### _Source Relative_
``` shell 
source "${0%/*}/../share/foo.sh"
```

### _printf_
``` shell 
printf "Hello %s, I'm %s" Sven Olga 
```
```
Hello Sven, I'm Olga
```

### _Directory of Script_
``` shell 
DIR="${0%/*}"
```

### _Getting Options_
``` shell 
while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -V | --version )
    echo $version
    exit
    ;;
  -s | --string )
    shift; string=$1
    ;;
  -f | --flag )
    flag=1
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi
```

### _Heredoc_
``` shell 
cat <<END
hello world
END
```

### _Reading Input_
``` shell
echo -n "Proceed? [y/n]: "
read ans
echo $ans
read -n 1 ans    # Just one character
```
### _Special Variables_
- `$?` - Exit status of last task
- `$!` - PID of last background task
- `$$` - PID of shell

### _Move to Previous Directory_
``` shell
pwd # /home/user/foo
cd bar/
pwd # /home/user/foo/bar
cd -
pwd # /home/user/foo
```