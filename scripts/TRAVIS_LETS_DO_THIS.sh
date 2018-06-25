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
    
    if [ "$i" == "PPB/popupy.txt" ] || [ "$i" == "PPB_uBlock_AdGuard/popupy_uBO.txt" ]; then
        if [[ "$modul" != *" PAF_popupy.txt"* ]] ;then
            modul+=" "PAF_popupy.txt
        fi
    fi
    
    if [ "$i" == "PPB/strzalki.txt" ]; then
        if [[ "$modul" != *" PAF_strzalki.txt"* ]] ;then
            modul+=" "PAF_strzalki.txt
        fi
    fi
    
    if [ "$i" == "PPB/scroll_film.txt" ] || [ "$i" == "PPB_uBlock_AdGuard/scroll_film_uBO.txt" ]; then
        if [[ "$modul" != *" PAF_scroll_film.txt"* ]] ;then
            modul+=" "PAF_scroll_film.txt
        fi
    fi
    
    if [ "$i" == "PPB_uBlock_AdGuard/otagowane_linki_supplement.txt" ]; then
        if [[ "$modul" != *" PAF_otagowane_linki.txt"* ]] ;then
            modul+=" "PAF_otagowane_linki.txt
        fi
    fi
    
    if [ "$i" == "PPB_uBlock_AdGuard/odblokuj_prawy_uBO.txt" ]; then
        if [[ "$modul" != *" PAF_odblokuj_prawy.txt"* ]] ;then
            modul+=" "PAF_odblokuj_prawy.txt
        fi
    fi
    
    if [ "$i" == "PPB/newslettery_nie_popupy.txt" ] || [ "$i" == "PPB_uBlock_AdGuard/newslettery_uBO.txt" ]; then
        if [[ "$modul" != *" PAF_newslettery.txt"* ]] ;then
            modul+=" "PAF_newslettery.txt
        fi
    fi

done


$sciezka/VICHS_Travis.sh $glowna_lista $modul
