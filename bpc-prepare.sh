#!/bin/bash

[[ "$1" == "" ]] && {
    echo "Usage: ./bpc-prepare.sh src.list"
    exit
}

rm -rf ./build
rsync -a                        \
      --exclude=".*"            \
      -f"+ */"                  \
      -f"- *"                   \
      ./                        \
      ./build
for i in `cat $1`
do
    if [[ "$i" == \#* ]]
    then
        echo $i
    else
        filename=`basename -- $i`
        if [[ "${filename##*.}" == "php" || "${filename##*.}" == "phtml" ]]
        then
            echo "phptobpc $i"
            phptobpc $i > ./build/$i
        else
            echo "cp       $i"
            cp $i ./build/$i
        fi
    fi
done
cp bpc.conf $1 Makefile ./build/
