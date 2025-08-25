#!/usr/bin/env bash

reversed_string=""

for ((i = ${#1} - 1; i >= 0; i--)); do
	char="${1:i:1}"
	reversed_string+="$char"
done

echo "$reversed_string"
