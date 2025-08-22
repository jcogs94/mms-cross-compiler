#!/bin/bash

# Ensure input file path is passed as argument
if [[ "$1" == "" ]]; then
	echo "No path provided for the file that needs compiling. Rerun this script with two paths..."
	exit 1
fi

# Ensure output file path is passed as argument
if [[ "$2" == "" ]]; then
	echo "No path provided for the output file. Rerun this script with a two paths..."
	exit 1
fi

echo -e "Compiling C file to ARM binary using mms-cross-compiler image...\n"

# Run the Docker image. This will use the image already built to copy the files
# into the image, compile them, and spit out the result before closing
docker run --rm --platform linux/arm/v7 -v $(pwd):/mms mms-single-file-cross-compiler "$1" -o "$2"

echo -e "\nCross-compilation successful!"

