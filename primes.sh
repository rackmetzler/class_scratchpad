#!/bin/bash
# primes.sh	(K) 201608 Joshua A. Cripe <jcripe@wiseeyesent.com>
#
#		Count prime numbers between two arbitrary values, i.e. 0 to 100
#									...real quick
#
#		Actually, this program is pretty slow & you shouldn't use it
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
