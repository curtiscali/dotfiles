#!/bin/bash

shopt -s dotglob                                                                
for file in .*                                                                  
do                                                                              
    filename=$(basename "$file")

    if [ -e "$HOME/$filename" ]; then
        if [ "$filename" != "."  ] && [ "$filename" != ".."  ]; then
            homePath="$HOME/$filename"
            rm "$homePath" && ln -s "$file" "$HOME/$filename"
        fi
    fi                                                                          
done  
