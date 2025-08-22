#!/bin/bash

echo -e "\nInstalling all MMS Cross Compiler dependencies!\n"

set -euo pipefail

# Detect distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
    VERSION=$VERSION_CODENAME
else
    echo "Cannot detect OS. Exiting."
    exit 1
fi

echo "Detected distribution: $DISTRO ($VERSION)"

# Remove old versions if present
sudo apt-get remove -y docker docker-engine docker.io containerd runc || true

# Update apt
sudo apt-get update -y
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Add Docker’s official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/${DISTRO}/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Set up the repository dynamically
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/${DISTRO} ${VERSION} stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo -e "\n\nDocker successfully installed! Version installed:"
docker --version
echo -e "\n\n"

# Install QEMU to allow Docker to emulate ARM instructions
sudo apt-get update
sudo apt-get install qemu-user-static binfmt-support

echo -e "\n\nQEMU successfully installed!\n\n"

# Tell Docker to use buildx to create a new "builder instance" to use for builds
docker buildx create --use

# Tell new "builder instance" to download necessary drivers/qemu binaries and list available platforms
docker buildx inspect --bootstrap

echo -e "\n\nMMS Cross Compiler dependencies installed sucessfully!"

