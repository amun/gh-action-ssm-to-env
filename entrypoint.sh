#!/bin/bash -l

IFS=$'\n'
SSM_PATH=$1
aws ssm get-parameters-by-path --with-decryption \
    --path $1 \
    --query "Parameters[*].{Name:Name,Value:Value}" > params.json

VARNAMES=($(cat params.json  | jq -r ".[].Name" | sed 's~'$SSM_PATH'~~g'))
VALUES=($(cat params.json  | jq ".[].Value" | sed 's~'$SSM_PATH'~~g'))

for i in "${!VARNAMES[@]}"; 
do 
    echo "${VARNAMES[$i]}=${VALUES[$i]}" >> $GITHUB_ENV
    echo "::add-mask::${VALUES[$i]}"
done
