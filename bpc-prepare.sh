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
    if [[ "$i" =~ ^app/controller/.+\.php ]]
    then
        lowercase="${i,,}"
        echo $lowercase >> ./build/$1
        echo "phptobpc $i"
        phptobpc $i > ./build/$lowercase
    else
        if [[ "$i" =~ ^app/view/.+\.html ]]
        then
            filename=${i%.*}
            echo $filename.phtml >> ./build/$1
            echo "phptobpc $i"
            phptobpc $i > ./build/$filename.phtml
        else
            echo $i >> ./build/$1
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
        fi
    fi
done
cp bpc.conf Makefile ./build/
