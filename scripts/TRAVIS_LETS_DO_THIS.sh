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
    
    if [ "$i" == "PPB/popupy.txt" ] || [ "$i" == "PPB_uBlock_AdGuard/popupy_uBO.txt" ] || [ "$i" == "PPB_uBlock_AdGuard/popupy_specjalne_instrukcje.txt" ]; then
        if [[ "$modul" != *" PAF_pop-ups.txt"* ]] ;then
            modul+=" "PAF_pop-ups.txt
        fi
    fi
    
    if [ "$i" == "PPB/strzalki.txt" ]; then
        if [[ "$modul" != *" PAF_arrows.txt"* ]] ;then
            modul+=" "PAF_arrows.txt
        fi
    fi
    
    if [ "$i" == "PPB/scroll_film.txt" ] || [ "$i" == "PPB_uBlock_AdGuard/scroll_film_uBO.txt" ]; then
        if [[ "$modul" != *" PAF_scrolling_videos.txt"* ]] ;then
            modul+=" "PAF_scrolling_videos.txt
        fi
    fi
    
    if [ "$i" == "PPB/newslettery_nie_popupy.txt" ] || [ "$i" == "PPB_uBlock_AdGuard/newslettery_uBO.txt" ]; then
        if [[ "$modul" != *" PAF_newsletters.txt"* ]] ;then
            modul+=" "PAF_newsletters.txt
        fi
    fi
    
    if [ "$i" == "PPB_uBlock_AdGuard/otagowane_linki_supplement.txt" ]; then
        if [[ "$modul" != *" PAF_tagged_internal_links.txt"* ]] ;then
            modul+=" "PAF_tagged_internal_links.txt
        fi
    fi
    
    if [ "$i" == "PPB_uBlock_AdGuard/odblokuj_prawy_uBO.txt" ]; then
        if [[ "$modul" != *" PAF_unlocking_right_click.txt"* ]] ;then
            modul+=" "PAF_unlocking_right_click.txt
        fi
    fi
    
    if [ "$i" == "PPB/tla_autoreklamy.txt" ] || [ "$i" == "PPB_uBlock_AdGuard/tla_autoreklamy_uBO.txt" ]; then
        if [[ "$modul" != *" PAF_backgrounds_self-advertising.txt"* ]] ;then
            modul+=" "PAF_backgrounds_self-advertising.txt
        fi
    fi
    
    if [ "$i" == "PPB/widgety_kontaktowe_informacji_zwrotnej.txt" ]; then
        if [[ "$modul" != *" PAF_contact_feedback_widgets.txt"* ]] ;then
            modul+=" "PAF_contact_feedback_widgets.txt
        fi
    fi
    
    if [ "$i" == "PPB/widgety.txt" ] || [ "$i" == "PPB_uBlock_AdGuard/widgety_uBO.txt" ] || [ "$i" == "PPB_uBlock_AdGuard/widgety_specjalne_instrukcje.txt" ]; then
        if [[ "$modul" != *" PAF_other_widgets.txt"* ]] ;then
            modul+=" "PAF_other_widgets.txt
        fi
    fi

done


$sciezka/VICHS_Travis.sh $glowna_lista $modul
