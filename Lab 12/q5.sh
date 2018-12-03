#~moorejar/public_html/public/CIS351/Executables/Simplescalar/bin/sim-cache -cache:dl1 dl1:64:16:1:l -redir:prog opt -redir:sim output_dl1:64:16:1:l ~moorejar/public_html/public/CIS351/Lab_Cache/Tests/qsort/ss_qsort input_1e4
#~moorejar/public_html/public/CIS351/Executables/Simplescalar/bin/sim-cache -cache:dl1 dl1:64:16:1:l -redir:prog opt -redir:sim output_dl1:64:16:1:l ~moorejar/public_html/public/CIS351/Lab_Cache/Tests/qsort/ss_qsort input_1e4
#~moorejar/public_html/public/CIS351/Executables/Simplescalar/bin/sim-cache -cache:dl1 dl1:64:16:1:l -redir:prog opt -redir:sim output_dl1:64:16:1:l ~moorejar/public_html/public/CIS351/Lab_Cache/Tests/qsort/ss_qsort input_1e4


cache=1
until [ $cache -gt 4 ]
do
	echo "cache is $cache"
	counter=8
	until [ $counter -gt 64 ] #counter greater than 64
	do
		echo "ccounter is $counter"
		divisor=$(( 8192 / counter ))

		name="dl1:64:$counter:$cache:$cache"

		echo "~moorejar/public_html/public/CIS351/Executables/Simplescalar/bin/sim-cache -cache:dl1 $name -redir:prog opt -redir:sim output_$name ~moorejar/public_html/public/CIS351/Lab_Cache/Tests/qsort/ss_qsort input_1e4"
		~moorejar/public_html/public/CIS351/Executables/Simplescalar/bin/sim-cache -cache:dl1 $name -redir:prog opt -redir:sim output_$name ~moorejar/public_html/public/CIS351/Lab_Cache/Tests/qsort/ss_qsort input_1e4

		counter=$(( counter * 2))
	done
	cache=$(( cache * 2))
done


echo done creating files

cache=1
until [ $cache -gt 4 ]
do
	counter=8
	until [ $counter -gt 64 ] #counter greater than 64
	do
		name="output_$counter_$cache"
		output=$(grep "dl1.miss_rate" $name)
		echo "$output $counter $cache"
		counter=$(( counter * 2))
	done
	cache=$(( cache * 2))
done

