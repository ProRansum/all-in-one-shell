# all-in-one-shell
A easily referencable script to help accelerate script building for those whom veer on the side of the easily forgetful on the small things.


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
