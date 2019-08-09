#!/bin/bash

# Sciezka to miejsce, w którym znajduje się skrypt
sciezka=$(dirname "$0")

aktualna_godzina=$(date +"%H")

cd "$sciezka"/.. || exit

"$sciezka"/VICHS.sh PAF_arrows.txt PAF_backgrounds_self-advertising_supp.txt PAF_backgrounds_self-advertising.txt PAF_contact_feedback_widgets.txt PAF_newsletters_supp.txt PAF_newsletters.txt PAF_other_elements_supp.txt PAF_other_widgets.txt PAF_pop-ups_supp.txt PAF_pop-ups.txt PAF_push_supp.txt PAF_push.txt PAF_scrolling_videos_supp.txt PAF_scrolling_videos.txt PAF_supp.txt PAF_tagged_internal_links.txt PPB.txt


ost_plik=$(git log --since="10 minutes ago" --name-only --pretty=format: | sort | uniq)

function search() {
    echo "$ost_plik" | grep "$1"
}


if [ -z $(search "PPB.txt") ] && [ ! -z $(search "PAF_supp.txt") ]; then
    if [[ "$lista_g" != *" PPB.txt"* ]]; then
        lista_g+=" "PPB.txt
    fi
fi

if [ -z $(search "PAF_backgrounds_self-advertising.txt") ] && [ ! -z $(search "PAF_backgrounds_self-advertising_supp.txt") ]; then
    if [[ "$lista_g" != *" PAF_backgrounds_self-advertising.txt"* ]]; then
        lista_g+=" "PAF_backgrounds_self-advertising.txt
    fi
fi

if [ -z $(search "PAF_newsletters.txt") ] && [ ! -z $(search "PAF_newsletters_supp.txt") ]; then
    if [[ "$lista_g" != *" PAF_newsletters.txt"* ]]; then
        lista_g+=" "PAF_newsletters.txt
    fi
fi

if [ -z $(search "PAF_other_widgets.txt") ] && [ ! -z $(search "PAF_other_elements_supp.txt") ]; then
    if [[ "$lista_g" != *" PAF_other_widgets.txt"* ]]; then
        lista_g+=" "PAF_other_widgets.txt
    fi
fi

if [ -z $(search "PAF_pop-ups.txt") ] && [ ! -z $(search "PAF_pop-ups_supp.txt") ]; then
    if [[ "$lista_g" != *" PAF_pop-ups.txt"* ]]; then
        lista_g+=" "PAF_pop-ups.txt
    fi
fi

if [ -z $(search "PAF_push.txt") ] && [ ! -z $(search "PAF_push_supp.txt") ]; then
    if [[ "$lista_g" != *" PAF_push.txt"* ]]; then
        lista_g+=" "PAF_push.txt
    fi
fi

if [ -z $(search "PAF_scrolling_videos.txt") ] && [ ! -z $(search "PAF_scrolling_videos_supp.txt") ]; then
    if [[ "$lista_g" != *" PAF_scrolling_videos.txt"* ]]; then
        lista_g+=" "PAF_scrolling_videos.txt
    fi
fi

if [ -z $(search "PPB.txt") ] && [ ! -z $(search "PAF_supp.txt") ]; then
    if [[ "$lista_g" != *" PPB.txt"* ]]; then
        lista_g+=" "PPB.txt
    fi
fi

if [[ "$lista_g" ]]; then
    FORCED="true" "$sciezka"/VICHS.sh $lista_g
fi
