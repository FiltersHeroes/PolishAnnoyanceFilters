#!/bin/bash


# Sciezka to miejsce, w którym znajduje się skrypt
sciezka=$(dirname "$0")

cd $sciezka/..

ost_zmieniony_plik=$(git diff -z --name-only | xargs -0)

for i in $ost_zmieniony_plik; do
    if [ "$i" == "PPB/push.txt" ] || [ "$i" == "PPB_uBlock_AdGuard/push_uBO.txt" ]; then
        if [[ "$modul" != *" PAF_push.txt"* ]] ;then
            modul+=" "PAF_push.txt
        fi
    fi

    if [[ "$i" == "PPB"* ]]; then
        if [[ "$glowna_lista" != *" PPB.txt"* ]] ;then
            glowna_lista+=" "PPB.txt
        fi
    fi
    
    if [[ "$i" == "PPB_uBlock_AdGuard"* ]]; then
        glowna_lista+=" "PPB_uBlock_AdGuard.txt
    fi

done

$sciezka/VICHS.sh $modul $glowna_lista
