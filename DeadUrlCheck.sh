#!/bin/bash
input="urls.txt"
output="dead_urls.txt"
> $output
while read url; do
 if ! curl -s --head --request GET $url | grep "200 OK" > /dev/null; then
 echo "$url is DEAD" >> $output
 fi
done < $input
