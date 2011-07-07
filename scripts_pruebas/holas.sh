#!/bin/sh

echo "${1}"

[ "${1}" = "hola" ] && echo "hi"

if [ "${1}" = "hola" ]
then
       echo "hola"
fi
