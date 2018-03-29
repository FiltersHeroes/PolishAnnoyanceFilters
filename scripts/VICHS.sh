#!/bin/bash

# VICHS - Version Include Checksum Sort

for i in "$@"; do

    # Filtr to nazwa pliku, który chcemy zbudować
    FILTR=$(basename $i .txt)

    # Sciezka to miejsce, w którym znajduje się skrypt
    sciezka=$(dirname "$0")

    
    TEMPLATE=$sciezka/../templates/${FILTR}.template
    KONCOWY=$i
    TYMCZASOWY=$sciezka/../${FILTR}.temp
    SEKCJE_KAT=$sciezka/../${FILTR}

    # Podmienianie zawartości pliku końcowego na zawartość template'u
    cp -R $TEMPLATE $KONCOWY

    # SEKCJA_NS to sekcja, której zawartości nie chcemy sortować
    SEKCJA_NS=$(grep -oP '@NOSORTinclude \K.*' $KONCOWY)
        
    # Usuwanie pustych linii z sekcji
    find ${SEKCJE_KAT} -type f -exec sed -i '/^$/d' {} \;
    
    # Sortowanie sekcji
    find ${SEKCJE_KAT} -type f ! -iname ${SEKCJA_NS}.txt -exec sort -uV -o {} {} \;
    
    # Obliczanie ilości sekcji (wystąpień słowa @include w template'cie
    END=$(grep -o -i '@include' ${TEMPLATE} | wc -l)

    # Doklejanie sekcji w odpowiednie miejsca
    for (( n=1; n<=$END; n++ ))
    do
        SEKCJA=$(grep -oP -m 1 '@include \K.*' $KONCOWY)
        sed -e '0,/^@include/!b; /@include/{ r '${SEKCJE_KAT}/${SEKCJA}.txt'' -e 'd }' $KONCOWY > $TYMCZASOWY
        cp -R $TYMCZASOWY $KONCOWY
    done

    # Obliczanie ilości sekcji/list filtrów, które zostaną pobrane ze źródeł zewnętrznych
    END_URL=$(grep -o -i '@URLinclude' ${TEMPLATE} | wc -l)

    # Doklejanie zawartości zewnętrznych plików w odpowiednie miejsca
    for (( n=1; n<=$END_URL; n++ ))
    do
        ZEWNETRZNY=$(grep -oP -m 1 '@URLinclude \K.*' $KONCOWY)
        wget -O $SEKCJE_KAT/external.temp "${ZEWNETRZNY}"
        sed -e '0,/^@URLinclude/!b; /@URLinclude/{ r '$SEKCJE_KAT/external.temp'' -e 'd }' $KONCOWY > $TYMCZASOWY
        cp -R $TYMCZASOWY $KONCOWY
        rm -r $SEKCJE_KAT/external.temp
    done
    
    # Obliczanie ilości sekcji, w których ma zostać dokonana konwersja reguł na kompatybilne z AdGuardem
    END_AG=$(grep -o -i '@AGinclude' ${TEMPLATE} | wc -l)
    
    # Konwersja reguł na kompatybilne z AdGuardem
    for (( n=1; n<=$END_AG; n++ ))
    do
        AG=$(grep -oP -m 1 '@AGinclude \K.*' $KONCOWY)
        cp -R ${sciezka}/../${AG}.txt ${SEKCJE_KAT}/
        AG2REPLACE=$(basename ${AG})
        sed -i '/##html/d' ${SEKCJE_KAT}/${AG2REPLACE}.txt
        sed -i '/##body,html/d' ${SEKCJE_KAT}/${AG2REPLACE}.txt
        sed -i '/script:inject/d' ${SEKCJE_KAT}/${AG2REPLACE}.txt
        sed -i 's|#?#|##|g' ${SEKCJE_KAT}/${AG2REPLACE}.txt
        sed -i 's|-abp-has|has|g' ${SEKCJE_KAT}/${AG2REPLACE}.txt
        sed -i 's|-abp-contains|contains|g' ${SEKCJE_KAT}/${AG2REPLACE}.txt
        sed -i 's|has-text|contains|g' ${SEKCJE_KAT}/${AG2REPLACE}.txt
        sed -i '/:style/s/##/#$#/g' ${SEKCJE_KAT}/${AG2REPLACE}.txt
        sed -i '/:style/s/)/ }/g' ${SEKCJE_KAT}/${AG2REPLACE}.txt
        sed -i 's|:style(| { |g' ${SEKCJE_KAT}/${AG2REPLACE}.txt
        sed -e '0,/^@AGinclude/!b; /@AGinclude/{ r '${SEKCJE_KAT}/${AG2REPLACE}.txt'' -e 'd }' $KONCOWY > $TYMCZASOWY
        cp -R $TYMCZASOWY $KONCOWY
    done
    
    # Obliczanie ilości niesortowalnych sekcji
    END_NS=$(grep -o -i '@NOSORTinclude' ${TEMPLATE} | wc -l)
    
    # Doklejanie niesortowalnych sekcji w odpowiednie miejsca
    for (( n=1; n<=$END_NS; n++ ))
    do
        SEKCJA_NS=$(grep -oP -m 1 '@NOSORTinclude \K.*' $KONCOWY)
        sed -e '0,/^@NOSORTinclude/!b; /@NOSORTinclude/{ r '${SEKCJE_KAT}/${SEKCJA_NS}.txt'' -e 'd }' $KONCOWY > $TYMCZASOWY
        cp -R $TYMCZASOWY $KONCOWY
    done
    
    # Usuwanie tymczasowego pliku
    rm -r $TYMCZASOWY

    # Przejście do katalogu, w którym znajduje się lokalne repozytorium git
    cd $sciezka/..
    
    # Ustawianie nazwy kodowej (krótszej nazwy listy filtrów) do opisu commita w zależności od tego, co jest wpisane w polu „Codename:". Jeśli nie ma takiego pola, to trzeba podać nazwę kodową dla listy filtrów.
    if grep -q "! Codename" $i; then
        filtr=$(grep -oP '! Codename: \K.*' $i);
    else
        printf "Podaj nazwę kodową dla listy filtrów $(basename $i): "
        read filtr
    fi
    
    # Dodawanie zmienionych sekcji do repozytorium git
    git add $SEKCJE_KAT/*
    git commit -S -m "Update sections of $filtr [ci skip]"
    
    # Ustawienie polskiej strefy czasowej
    export TZ=":Poland"

    # Aktualizacja daty i godziny w polu „Last modified"
    export LC_ALL=en_US.UTF-8
    data=$(date +"%d %b %Y %H:%M UTC%:::z")
    sed -i '/! Last modified:/c\'"! Last modified: $data" $i

    # Aktualizacja wersji
    wersja=$(date +"%Y%m%d%H%M")
    sed -i '/! Version:/c\'"! Version: $wersja" $i

    # Aktualizacja pola „aktualizacja"
    export LC_ALL=pl_PL.UTF-8
    aktualizacja=$(date +"%a, %d %b %Y, %H:%M UTC%:::z")
    sed -i '/! Aktualizacja:/c\'"! Aktualizacja: $aktualizacja" $i
    
    # Aktualizacja sumy kontrolnej
    # Założenie: kodowanie UTF-8 i styl końca linii Unix
    # Usuwanie starej sumy kontrolnej i pustych linii
    grep -v '! Checksum: ' $i | grep -v '^$' > $i.chk
    # Pobieranie sumy kontrolnej... Binarny MD5 zakodowany w Base64
    suma_k=`cat $i.chk | openssl dgst -md5 -binary | openssl enc -base64 | cut -d "=" -f 1`
    # Zamiana atrapy sumy kontrolnej na prawdziwą
    sed -i "/! Checksum: /c\! Checksum: $suma_k" $i
    rm -r $i.chk
    
    # Dodawanie zmienionych plików do repozytorium git
    git add $i
    printf "Podaj rozszerzony opis commita do listy filtrów $filtr, np 'Fix #1, fix #2' (bez ciapek; jeśli nie chcesz rozszerzonego opisu, to możesz po prostu nic nie wpisywać): "
    read roz_opis
    git commit -S -m "Update $filtr to version $wersja [ci skip]" -m "${roz_opis}"
done

# Wysyłanie zmienionych plików do repozytorium git
echo "Czy chcesz teraz wysłać do gita zmienione pliki?"
select yn in "Tak" "Nie"; do
    case $yn in
        Tak ) 
        git push
        break;;
        Nie ) break;;
esac
done
