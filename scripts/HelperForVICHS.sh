#!/bin/bash

# Helper for VICHS - helper for Version Include Checksum Hosts Sort script

# MIT License

# Copyright (c) 2019 Polish Filters Team

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


# SCRIPT_PATH to miejsce, w którym znajduje się skrypt
SCRIPT_PATH=$(dirname "$(realpath -s "$0")")

cd "$SCRIPT_PATH"/.. || exit

for i in "$@"; do
    "$SCRIPT_PATH"/VICHS.sh "$i"
done

last_file=$(git log --since="10 minutes ago" --name-only --pretty=format: | sort | uniq)

function search() {
    grep "$1" <<< "$last_file"
}

function addListToVarIfAnotherListUpdated() {
    if [[ -z $(search "$1") ]] && [[ -n $(search "$2") ]]; then
        if ! grep -q "$1" <<< "${MAIN_FILTERLIST[*]}"; then
            MAIN_FILTERLIST+=("$1")
        fi
    fi
}

CONFIG=$SCRIPT_PATH/VICHS.config
END=$(grep -o -i '@updateListIfAnotherListUpdated' "${CONFIG}" | wc -l)
for (( n=1; n<=END; n++ ))
do
    LIST=$(grep -oP -m "$n" '@updateListIfAnotherListUpdated \K.*' "$CONFIG" | tail -n1 | awk -F " " '{print $1;}')
    ANOTHER_LIST=$(grep -oP -m "$n" '@updateListIfAnotherListUpdated \K.*' "$CONFIG" | tail -n1 | awk -F " " '{print $2;}')
    addListToVarIfAnotherListUpdated "$LIST" "$ANOTHER_LIST"
done

if [ "${MAIN_FILTERLIST[*]}" ]; then
    FORCED="true" "$SCRIPT_PATH"/VICHS.sh "${MAIN_FILTERLIST[@]}"
fi
