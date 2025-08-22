#!/bin/bash

echo -e "\nBuilding MMS Cross Compiler Docker image...\n"

docker buildx build --no-cache --platform linux/arm/v7 -t mms-cross-compiler . --load

echo -e "\nSuccess!"

