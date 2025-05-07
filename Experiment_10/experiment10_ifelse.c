#!/bin/bash
echo "Enter a number:"
read num
if [ $num -gt 0 ]
then
    echo "The number is positive."
else
    echo "The number is zero or negative."
fi
