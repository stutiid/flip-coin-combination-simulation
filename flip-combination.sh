#!/bin/bash -x

H=0
T=0
HH=0
HT=0
TH=0
TT=0
HHH=0
HHT=0
HTH=0
HTT=0
THH=0
THT=0
TTH=0
TTT=0

count=60
declare -A coinCombination

#singlet combination
for ((i=1; i<=60; i++))
do
	flip=$((RANDOM%2))
	if [ $flip -eq 0 ]
	then
		((H++))
	else
		((T++))
	fi
done
coinCombination[1]=$(($(($H*100))/$count))
coinCombination[2]=$(($T*100/$count))

#doublet combination
count=60
for ((i=1; i<=count; i++))
do
   flip=$((RANDOM%2))
   if [ $flip -eq 0 ]
   then
      flip=$((RANDOM%2))
		if [ $flip -eq 0 ]
		then
			((HH++))
		else
			((HT++))
		fi
   else
      flip=$((RANDOM%2))
      if [ $flip -eq 0 ]
      then
         ((TH++))
      else
         ((TT++))
      fi
   fi
done
coinCombination[3]=$(($HH*100/$count))
coinCombination[4]=$(($HT*100/$count))
coinCombination[5]=$(($TH*100/$count))
coinCombination[6]=$(($TT*100/$count))

#triplet combination
count=60
for ((i=1; i<=count; i++))
do
   flip=$((RANDOM%2))
   if [ $flip -eq 0 ]
   then
      flip=$((RANDOM%2))
      if [ $flip -eq 0 ]
      then
         flip=$((RANDOM%2))
			if [ $flip -eq 0 ]
			then
				((HHH++))
			else
				((HHT++))
			fi
		else
         flip=$((RANDOM%2))
         if [ $flip -eq 0 ]
         then
            ((HTH++))
         else
            ((HTT++))
         fi
		fi
   else
      flip=$((RANDOM%2))
      if [ $flip -eq 0 ]
      then
         flip=$((RANDOM%2))
         if [ $flip -eq 0 ]
         then
            ((THH++))
         else
            ((THT++))
         fi
      else
         flip=$((RANDOM%2))
         if [ $flip -eq 0 ]
         then
            ((TTH++))
         else
            ((TTT++))
         fi
      fi
   fi
done
coinCombination[7]=$(($HHH*100/$count))
coinCombination[8]=$(($HHT*100/$count))
coinCombination[9]=$(($HTH*100/$count))
coinCombination[10]=$(($HTT*100/$count))
coinCombination[11]=$(($THH*100/$count))
coinCombination[12]=$(($THT*100/$count))
coinCombination[13]=$(($TTH*100/$count))
coinCombination[14]=$(($TTT*100/$count))
echo ${coinCombination[@]}

max=${coinCombination[1]}
n=1
for ((i=1; i<=14; i++))
do
	if [ $max -lt ${coinCombination[$i]} ]
	then
		max=${coinCombination[$i]}
		n=$i
	fi
done

echo $n
case $n in
	1)
		echo "winning combination is H with $max winning"
	;;
	2)
      echo "winning combination is T with $max winning"
   ;;
	3)
      echo "winning combination is HH with $max winning"
   ;;
	4)
      echo "winning combination is HT with $max winning"
   ;;
	5)
      echo "winning combination is TH with $max winning"
   ;;
 	6)
      echo "winning combination is TT with $max winning"
   ;;
 	7)
      echo "winning combination is HHH with $max winning"
   ;;
 	8)
      echo "winning combination is HHT with $max winning"
   ;;
 	9)
      echo "winning combination is HTH with $max winning"
   ;;
 	10)
      echo "winning combination is HTT with $max winning"
   ;;
 	11)
      echo "winning combination is THH with $max winning"
   ;;
 	12)
      echo "winning combination is THT with $max winning"
   ;;
 	13)
      echo "winning combination is TTH with $max winning"
   ;;
 	14)
      echo "winning combination is TTT with $max winning"
   ;;
	*)
		echo "no one winning"
	;;
esac
