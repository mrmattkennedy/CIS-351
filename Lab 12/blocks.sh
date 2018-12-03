#!/bin/bash

counter=8
until [ $counter -gt 64 ] #counter greater than 64
do
	divisor=$(( 8192 / counter ))

	name="dl1:$divisor:$counter:1:l"

	~moorejar/public_html/public/CIS351/Executables/Simplescalar/bin/sim-cache -cache:dl1 $name -redir:prog /dev/null -redir:sim output_$counter a.out
	counter=$(( counter * 2))
	
done 

echo done creating files
touch results.txt

counter=8
until [ $counter -gt 64 ]
do
	name="output_$counter"
	output=$(grep "dl1.miss_rate" $name)
	echo "$output $counter"
	counter=$(( counter * 2))
done
