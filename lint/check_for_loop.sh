#!/usr/bin/env bash

Check_for_loop()
{
    stringg=$(cat $FILE)
    StringFor=$(echo "$stringg"| grep -Poz "for\b(\s*|.+){1,}\bdone")
    echo "hey"

    if [ -n "$StringFor" ]; then

        echo ""  
        StringForChecked=$(echo "$StringFor" | grep -Poz "\bfor\b\s*(\(\()+.+(\)\));?\s*(\bdo\b)\s+(.|\s)+\b(done)\b" | tr -d '\0' >out.txt)
        StringForChecked=$(cat out.txt)
        echo ""

        if [ -z "$StringForChecked" ]; then

            echo ''
            echo "There is error in : For Loop "
            echo  "$StringFor"
            echo ""

        else

            echo "There is no error in For Loop "
            echo ""

        fi

    else

        echo "no for loop caught"

    fi
}