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
coinCombination["HH"]=$(($HH*100/$count))
coinCombination["HT"]=$(($HT*100/$count))
coinCombination["TH"]=$(($TH*100/$count))
coinCombination["TT"]=$(($TT*100/$count))

#triplet combination
count=20
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
coinCombination["HHH"]=$(($HHH*100/$count))
coinCombination["HHT"]=$(($HHT*100/$count))
coinCombination["HTH"]=$(($HTH*100/$count))
coinCombination["HTT"]=$(($HTT*100/$count))
coinCombination["THH"]=$(($THH*100/$count))
coinCombination["THT"]=$(($THT*100/$count))
coinCombination["TTH"]=$(($TTH*100/$count))
coinCombination["TTT"]=$(($TTT*100/$count))

echo ${coinCombination[@]}

