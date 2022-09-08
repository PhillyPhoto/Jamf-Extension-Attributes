#!/bin/bash

ipV4s=()

for link in $(ifconfig | expand | cut -c1-8 | sort | uniq -u | awk -F: '{print $1;}')
do
	if [[ "$link" == "en"* ]] || [[ "$link" == "utun"* ]]
	then
		if [[ "$(ifconfig $link)" == *"inet "* ]]
		then
			ipV4s+=("$link: $(ifconfig $link | grep -a 'inet ' | awk '{print $2}')")
		fi
	fi
done

echo "<result>${ipV4s[@]}</result>"
