#!/bin/bash
# pi = 4*atan(1)

function f {
    x=$(echo "$1*10" | bc -l)
    echo "$x^3" | bc -l
}

function rand {
    echo "$RANDOM/32767.0" | bc -l
}

sum=0
for i in `seq 1 $1`;
do
    res=$(rand)
    res=$(f $res)
    sum=$(echo "$sum+$res" | bc -l)
done
echo "$sum/$1" | bc -l