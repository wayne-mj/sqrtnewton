# sqrtnewton

This is a rewrite of a REXX script that I came across similar to the one on Wikipedia [Rexx](https://en.wikipedia.org/wiki/Rexx) to find the square root of a positive number.

I have modified the code to include:
- Correct for negative numbers
- Set a limit for iterations
- Set tolerances for 32, 64 and 128 bit REAL numbers

This all came about as I am doing some courses on using the z/OS and writing code in REXX is one of the course modules.

The functions return a type structure:
```
real(32)        ::  sqr32
real(64)        ::  sqr64
real(128)       ::  sqr32
integer         ::  iterations
character(32)   :: msg
```
That provides feedback about the result, how many iterations it took, and if it was necessary to modify the number to perform the operation, for example if the number was negative an operation of multiplying by -1 would be required as the result is an imaginary number and the algorithm without a defined set of iterations can become an infinite loop of positive and negative numbers.

I have included comments in the code on how to revert the functions to a state that return only the result of the operation without the extraneous data should that be wanted.