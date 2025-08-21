#!/bin/bash

echo -e "\nBuilding MMS Cross Single File Compiler Docker image...\n"

docker buildx build --platform linux/arm/v7 -t mms-single-file-cross-compiler . --load

echo -e "\nSuccess!"

