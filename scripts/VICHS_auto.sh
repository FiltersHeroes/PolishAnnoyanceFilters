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
    
    if [[ "$i" == "PPB"* ]]; then
        if [[ "$glowna_lista" != *" PPB.txt"* ]] ;then
            glowna_lista+=" "PPB.txt
        fi
    fi
    
    if [[ "$i" == "PPB_uBlock_AdGuard"* ]]; then
        if [[ "$glowna_lista" != *" PPB_uBlock_AdGuard.txt"* ]] ;then
            glowna_lista+=" "PPB_uBlock_AdGuard.txt
        fi
    fi

done

$sciezka/VICHS.sh $modul $glowna_lista
