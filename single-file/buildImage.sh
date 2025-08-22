#!/bin/bash

echo -e "\nBuilding Docker Image for MMS Single File Cross Compiler...\n"

docker buildx build --platform linux/arm/v7 -t mms-single-file-cross-compiler . --load

echo -e "\nSuccess!"

