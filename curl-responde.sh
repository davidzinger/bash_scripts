#!/bin/bash

port = 8000
message = "flask content:"

for i in 1 2
do
   
        if [ $i = 2 ]
        then
        
                port = 80
                message = "nginx contect"
        fi
        URL="http://0.0.0.0:$port/"

        response=$(curl -s -w "%{http_code}" $URL)
        
        http_code=$(tail -n1 <<< "$response")  # get the last line
        content=$(sed '$ d' <<< "$response")   # get all but the last line which contains the status code

        echo "http_code is: $http_code"
        echo "$message + $content"

done
