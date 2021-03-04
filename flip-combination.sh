#welcome to flipping the coin combination and choosing the winner
#!/bin/bash -x

flip=$((RANDOM%2))
if [ $flip -eq 0 ]
then
	echo heads
else
	echo tails
fi
