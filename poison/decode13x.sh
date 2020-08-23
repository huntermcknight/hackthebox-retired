#!/bin/bash

STRING=$(base64 -d --ignore-garbage $1)

for i in $(seq 1 12)
do 
    STRING=$(echo "$STRING" | base64 -d)
done

echo "$STRING"
