#!/bin/bash

sudo ./install.sh
./buildImage.sh
./single-file/buildImage.sh

echo -e "\n\nMMS Docker images:"
docker image ls | grep mms

echo -e "\n\nAll MMS Cross Compiler dependencies installed and Docker images built succesfully!"

