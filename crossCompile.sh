#!/bin/bash

echo "Compiling C program to ARM binary using mms-cross-compiler image..."

# Run the Docker image. This will use the image already built to copy the files
# into the image, compile them, and spit out the result before closing
docker run --rm --platform linux/arm/v7 -v $(pwd):/mms mms-cross-compiler

echo -e "Cross-compilation successful!"

