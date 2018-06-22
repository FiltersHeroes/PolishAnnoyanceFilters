#!/bin/bash

# Sciezka to miejsce, w którym znajduje się skrypt
sciezka=$(dirname "$0")

cd $sciezka/..

ost_commit_katalog=$(dirname $(git diff-tree --no-commit-id --name-only -r master))
ost_commit_plik=$(git diff-tree --no-commit-id --name-only -r master)

if [ "$ost_commit_katalog" == "PPB" ]; then
    glowna_lista="PPB.txt"
elif [ "$ost_commit_katalog" == "PPB_uBlock_AdGuard" ]; then
    glowna_lista="PPB_uBlock_AdGuard.txt"
fi

for i in $ost_commit_plik; do
    if [ "$i" == "PPB/push.txt" ] || [ "$i" == "PPB_uBlock_AdGuard/push_uBO.txt" ]; then
        if [[ "$modul" != *" PAF_push.txt"* ]] ;then
            modul+=" "PAF_push.txt
        fi
    fi

done


$sciezka/VICHS_Travis.sh $glowna_lista $modul
