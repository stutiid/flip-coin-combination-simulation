#!/bin/bash -x

H=0
T=0
HH=0
HT=0
TH=0
TT=0
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
coinCombination["H"]=$(($(($H*100))/$count))
coinCombination["T"]=$(($T*100/$count))

#doublet combination
count=30
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

echo $HH $HT $TH $TT
coinCombination["HH"]=$(($HH*100/$count))
coinCombination["HT"]=$(($HT*100/$count))
coinCombination["TH"]=$(($TH*100/$count))
coinCombination["TT"]=$(($TT*100/$count))

echo ${coinCombination[@]}
