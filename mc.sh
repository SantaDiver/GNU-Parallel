#!/bin/bash
# pi = 4*atan(1)

function f {
    echo "scale=10; 4 * $1^3" | bc -l
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