#!/usr/bin/env bash
Check_while_loop()
    {
        StringFor=$(cat $FILE | grep -Poz "(\bwhile\b)(\s*|.+){1,}(\bdone\b)")

        if [ -n "$StringFor" ]; then

            echo ""
            echo "hi"
            StringForChecked=$(echo $StringFor | grep -Poz "\b(while)\b\s+\[\s.*\s\](?!(?=do))\s*;?\s*\bdo\b(?!(?=\s+done)).*(?(?=\n)\s+|.+){1,}\bdone\b" | tr -d '\0' >out.txt)
            StringFor=$(cat out.txt)
            echo ""

            if [ -z "$StringForChecked" ]; then
                
                echo "There is error in While Loop : "
                echo  "$StringFor"
                echo ""
        
            else

                printf "there is no error in While conditional "

            fi
            
        fi
    }