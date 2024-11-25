#!/bin/bash

# Convert to pdf
# _convert.sh my_document.md pdf
# Convert to epub and html
# _convert.sh my_document.md epub html
# Convert to all supported OUTPUT_FORMATS
# _convert.sh my_document.md

# Grab the input file name from first argument
INPUT_FILE=$1
shift # past first argument
echo "input file: ${INPUT_FILE}"

# Grab the output formats from the remaing arguments
#     defaults set in case 'all tested formats' is desired
OUTPUT_FORMATS=("pdf" "html" "epub" "docx" "odt")
if [[ $# -gt 0 ]]; then
    OUTPUT_FORMATS=() # nuke defaults
    while [[ $# -gt 0 ]]; do
        OUTPUT_FORMATS+=("$1") # save output format
        shift # past argument
    done
fi
echo "output formats: ${OUTPUT_FORMATS[*]}"

# Process as needed
for format in ${OUTPUT_FORMATS[*]}; do
    #echo "----------"
    echo "processing ${format}"
    ADDITIONAL_ARGS=""
    ADDITIONAL_INPUT_YML=""
    if [ "epub" = ${format} ]; then
        #echo "epub special case"
        ADDITIONAL_INPUT_YML="input/${INPUT_FILE}.yml"
        ADDITIONAL_ARGS="--epub-embed-font ./fonts/\*"
        ADDITIONAL_ARGS+=" --css fonts_epub.css"
    fi
    if [ "odt" = ${format} ]; then
        #echo "odt special case"
        ADDITIONAL_ARGS="--reference-doc fonts_odt.odt"
    fi
    if [ "docx" = ${format} ]; then
        #echo "docx special case"
        ADDITIONAL_ARGS="--reference-doc fonts_docx.docx"
    fi
    #echo "additional args: '${ADDITIONAL_ARGS}'"
    #echo "additional input yml: '${ADDITIONAL_INPUT_YML}'"
    #set -x
    pandoc \
        --lua-filter=noexport-subtrees.lua \
        -d defaults.yml \
        -d defaults_pdf.yml \
        -d defaults_user.yml \
        --metadata-file authorship.yml \
        ${ADDITIONAL_ARGS} \
        -o output/${INPUT_FILE}.${format} \
        ${ADDITIONAL_INPUT_YML} \
        input/${INPUT_FILE}
    #set +x
done
