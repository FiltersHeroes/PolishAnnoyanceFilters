#!/bin/bash

# Helper for VICHS - helper for Version Include Checksum Hosts Sort script
# v1.3

# MIT License

# Copyright (c) 2021 Polish Filters Team

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#
#

# SCRIPT_PATH to miejsce, w którym znajduje się skrypt
SCRIPT_PATH=$(dirname "$(realpath -s "$0")")

# MAIN_PATH to miejsce, w którym znajduje się główny katalog repozytorium
# Zakładamy, że skrypt znajduje się gdzieś w repozytorium git,
# w którym są pliki listy filtrów, którą chcemy zaktualizować.
# Jednakże jeżeli skrypt znajduje się gdzieś indziej, to
# zezwalamy na nadpisanie zmiennej MAIN_PATH.
if [ -z "$MAIN_PATH" ]; then
    MAIN_PATH=$(git -C "$SCRIPT_PATH" rev-parse --show-toplevel)
fi

cd "$MAIN_PATH" || exit

V_CHANGED_FILES_FILE="$SCRIPT_PATH"/V_CHANGED_FILES.txt

if [ -f "$V_CHANGED_FILES_FILE" ]; then
    rm -rf "$V_CHANGED_FILES_FILE"
fi

SAVE_CHANGED_FN="true" "$SCRIPT_PATH"/VICHS.sh "$@"

V_CHANGED_FILES=$(cat "$V_CHANGED_FILES_FILE")

function search() {
    # Pobieramy informacje o dodanych plikach ze skryptu VICHS
    # i szukamy w nich wybranych nazw plików
    grep "$1" <<<"$V_CHANGED_FILES"
}

function addListToVarIfAnotherListUpdated() {
    if [[ -z $(search "$1") ]] && [[ -n $(search "$2") ]]; then
        if ! grep -q "$1" <<<"${MAIN_FILTERLIST[*]}"; then
            MAIN_FILTERLIST+=("$1")
        fi
    fi
}

CONFIG="$SCRIPT_PATH"/VICHS.config
END=$(grep -o -i '@updateListIfAnotherListUpdated' "${CONFIG}" | wc -l)
for ((n = 1; n <= END; n++)); do
    LIST=$(grep -oP -m "$n" '@updateListIfAnotherListUpdated \K.*' "$CONFIG" | tail -n1 | awk -F " " '{print $1;}')
    ANOTHER_LIST=$(grep -oP -m "$n" '@updateListIfAnotherListUpdated \K.*' "$CONFIG" | tail -n1 | awk -F " " '{print $2;}')
    addListToVarIfAnotherListUpdated "$LIST" "$ANOTHER_LIST"
done

if [ "${MAIN_FILTERLIST[*]}" ]; then
    FORCED="true" "$SCRIPT_PATH"/VICHS.sh "${MAIN_FILTERLIST[@]}"
fi

rm -rf "$V_CHANGED_FILES_FILE"
