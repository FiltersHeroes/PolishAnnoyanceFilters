#!/bin/bash

# Sciezka to miejsce, w którym znajduje się skrypt
sciezka=$(dirname "$0")

aktualna_godzina=$(date +"%H")

cd "$sciezka"/.. || exit

if [ "$CI" = "true" ]; then
    if [[ "$aktualna_godzina" == "10" ]]; then
    ost_plik=$(git log --since="11 hours 58 minutes ago" --name-only --pretty=format: | sort | uniq)
    else
    ost_plik=$(git log --since="3 hours 58 minutes ago" --name-only --pretty=format: | sort | uniq)
    fi
else
    ost_plik=$(git diff -z --name-only | xargs -0)
fi

for i in $ost_plik; do
    if [ "$i" == "PPB/push.txt" ] || [ "$i" == "PPB/uBO_AG/push_suplement.txt" ]; then
        if [[ "$modul" != *" PAF_push.txt"* ]]; then
            modul+=" "PAF_push.txt
        fi
    fi

    if [ "$i" == "PPB/uBO_AG/popupy_suplement.txt" ] || [ "$i" == "PPB/uBO_AG/popupy_uBO.txt" ] || [ "$i" == "PPB/uBO_AG/popupy_AG.txt" ] || [ "$i" == "PPB/uBO_AG/popupy_bez_html.txt" ] || [ "$i" == "PPB/uBO_AG/popupy_html.txt" ]; then
        if [[ "$modul" != *" PAF_pop-ups_supp.txt"* ]]; then
            modul+=" "PAF_pop-ups_supp.txt
        fi
    fi

    if [ "$i" == "PPB/popupy.txt" ] || [ "$i" == "PPB/uBO_AG/popupy_suplement.txt" ] || [ "$i" == "PPB/uBO_AG/popupy_uBO.txt" ] || [ "$i" == "PPB/uBO_AG/popupy_AG.txt" ]  || [ "$i" == "PPB/uBO_AG/popupy_bez_html.txt" ] || [ "$i" == "PPB/uBO_AG/popupy_html.txt" ]; then
        if [[ "$modul" != *" PAF_pop-ups.txt"* ]]; then
            modul+=" "PAF_pop-ups.txt
        fi
    fi

    if [ "$i" == "PPB/strzalki.txt" ]; then
        if [[ "$modul" != *" PAF_arrows.txt"* ]] ;then
            modul+=" "PAF_arrows.txt
        fi
    fi

    if [ "$i" == "PPB/scroll_film.txt" ] || [ "$i" == "PPB/uBO_AG/scroll_film_suplement.txt" ] || [ "$i" == "PPB/uBO_AG/scroll_film_userCSS.txt" ] || [ "$i" == "PPB/uBO_AG/scroll_film_non_userCSS.txt" ] || [ "$i" == "PPB/uBO_AG/scroll_film_AG.txt" ]; then
        if [[ "$modul" != *" PAF_scrolling_videos.txt"* ]]; then
            modul+=" "PAF_scrolling_videos.txt
        fi
    fi

    if [ "$i" == "PPB/newslettery_nie_popupy.txt" ] || [ "$i" == "PPB/uBO_AG/newslettery_suplement.txt" ]; then
        if [[ "$modul" != *" PAF_newsletters.txt"* ]]; then
            modul+=" "PAF_newsletters.txt
        fi
    fi

    if [ "$i" == "PPB/uBO_AG/otagowane_linki_suplement.txt" ]; then
        if [[ "$modul" != *" PAF_tagged_internal_links.txt"* ]]; then
            modul+=" "PAF_tagged_internal_links.txt
        fi
    fi

    if [ "$i" == "PPB/tla_autoreklamy.txt" ] || [ "$i" == "PPB/uBO_AG/tla_autoreklamy_suplement.txt" ]; then
        if [[ "$modul" != *" PAF_backgrounds_self-advertising.txt"* ]]; then
            modul+=" "PAF_backgrounds_self-advertising.txt
        fi
    fi

    if [ "$i" == "PPB/widgety_kontaktowe_informacji_zwrotnej.txt" ]; then
        if [[ "$modul" != *" PAF_contact_feedback_widgets.txt"* ]]; then
            modul+=" "PAF_contact_feedback_widgets.txt
        fi
    fi

    if [ "$i" == "PPB/inne.txt" ] || [ "$i" == "PPB/uBO_AG/inne_AG.txt" ] || [ "$i" == "PPB/uBO_AG/inne_bez_html.txt" ] || [ "$i" == "PPB/uBO_AG/inne_html.txt" ] || [ "$i" == "PPB/uBO_AG/inne_suplement.txt" ]; then
        if [[ "$modul" != *" PAF_other_widgets.txt"* ]]; then
            modul+=" "PAF_other_widgets.txt
        fi
    fi

    if [[ "$i" == "PPB"* ]]; then
        if [[ "$glowna_lista" != *" PPB.txt"* ]]; then
            glowna_lista+=" "PPB.txt
        fi
    fi

done

if [[ "$glowna_lista" && "$modul" ]]; then
    "$sciezka"/VICHS.sh $glowna_lista $modul
fi
