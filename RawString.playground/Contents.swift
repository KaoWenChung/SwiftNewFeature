/*
 - Definition
    A raw string in programming allows all characters in a string literal to remain the same in code and in the material, rather than performing their standard programming functions
 
 - When to use?
    Raw strings are useful when handling strings that use a lot of backslashes, such as Windows paths and regular expression patterns
 */

let aRawString = #"This is a raw string"#

print(aRawString)

let regularString = "This is a string with symbol \"\\\""

print(regularString)

let rawString = #"This is a string with "\""#

print(rawString)

let amount = 1

// string interpolation
let rawStringWithInt = #"I have \#(amount) dollar!"#

print(rawStringWithInt)
