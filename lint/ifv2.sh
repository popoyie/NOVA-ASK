#!/usr/bin/env bash
FIL=$FILE
FIL=$( echo "$FIL" | tr -d '\0')
StringFor=$( echo "$FIL" | grep -Poz "\bif\b(\s*|.+){1,}\bfi\b\n" ) 
StringFor=$(cat "out.txt")
if [ -n "$StringFor" ]; then
    # echo ""
    # echo "$StringFor"
    # echo "hi"
    StringForChecked=$( echo "$StringFor" | grep -Poz "\bif\s+(\[\s+).+(\s+\])(\s+|;)\s?\bthen(?!(?=\s+\bfi))\s+(?(?=\n)\s+|.+){1,}?\bfi\b\n" | tr -d '\0' >out1.txt)

    # echo "a = $StringFor"
    # echo "$FIL"   
    StringForChecked=$(cat "out1.txt")

    # echo ""
    if [ -n "$StringForChecked" ]; then

        echo "There is error in : "
        echo  "$StringFor"
        echo ""
   
    else
         printf "there is no error in IF conditional "
    fi
    
fi

# for\s*(\(\()+.+(\)\));\s*\bdo\b\s+(.|\s)+\b(done)\b