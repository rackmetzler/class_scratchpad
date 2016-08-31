#!/bin/bash
# primes.sh	(K) 201608 Joshua A. Cripe <jcripe@wiseeyesent.com>
#
#		Count prime numbers between two arbitrary values, i.e. 0 to 100
#									...real quick
#
#		Actually, this program is pretty slow & you shouldn't use it
# [josh9580@reed class_scratchpad]$ for i in {10,100,1000,10000,100000}; do echo; (>&2 echo $i Numbers); time ./primes.sh 0 $i 1>/dev/null; done
# 
# 10 Numbers
# 
# real	0m0.002s
# user	0m0.002s
# sys	0m0.000s
# 
# 100 Numbers
# 
# real	0m0.011s
# user	0m0.011s
# sys	0m0.000s
# 
# 1000 Numbers
# 
# real	0m0.542s
# user	0m0.539s
# sys	0m0.002s
# 
# 10000 Numbers
# 
# real	0m39.002s
# user	0m38.901s
# sys	0m0.001s
# 
#
prime_test() {
	let "end=$1-1"
	x=2
	while [[ $x -lt $end ]]; do
		let "$1%$x" || return 1
		let "x=$x+1"
	done
	return 0
}

Start=${1:-0}
shift
Stop=${1:-100}
shift

if [[ $Start -lt 0 || $Stop -lt 0 || $Stop -lt $Start ]]; then echo "Probably not a good idea..."; exit 1; fi

i=1
while [[ $i -lt $Stop ]]; do
	prime_test $i && echo $i
	let "i=$i+1"
done
