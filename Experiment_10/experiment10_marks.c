#!/bin/bash
echo "Enter marks for Operating Systems (OS): "
read os
echo "Enter marks for Data Structures (DS): "
read ds
total=$((os + ds))
percentage=$((total / 2))
echo "Total Marks = $total"
echo "Percentage = $percentage%"
if [ $percentage -ge 75 ]; then
    echo "Result: PASS with DISTINCTION"
elif [ $percentage -ge 60 ] && [ $percentage -le 74 ]; then
    echo "Result: PASS with FIRST CLASS"
elif [ $percentage -ge 45 ] && [ $percentage -le 59 ]; then
    echo "Result: PASS"
else
    echo "Result: FAIL"
fi

