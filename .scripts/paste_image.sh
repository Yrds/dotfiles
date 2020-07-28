#!/usr/bin/env bash

function get_extension(){
  echo "${1##*.}"
}

function get_mime(){
  declare -A EXTENSION_MIMES=(
   [png]="image/png"
  )

  echo ${EXTENSION_MIMES[$1]}
}

while getopts 'o:' c
do
  case $c in
    o) OUTPUT=$OPTARG ;;
  esac
done

if [ -z $OUTPUT ]; then
  echo "not file specified"
  exit 1
fi



EXTENSION=`get_extension $OUTPUT`
MIME_TYPE=`get_mime $EXTENSION`

echo "MIME:" $MIME_TYPE


xclip -selection clipboard -o -t $MIME_TYPE > $OUTPUT
