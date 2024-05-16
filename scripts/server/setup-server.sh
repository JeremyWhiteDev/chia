#!/bin/bash

echo "Checking if Docker is installed."
if [! command -v docker &> /dev/null]; then
    echo "Docker is not installed. Proceeding with installation."
    ./install-docker.sh
    echo "Docker installed successfully."
else
    echo "Docker is already installed."
fi

echo "Checking if Git is installed."
if [! command -v git &> /dev/null]; then
    echo "Git is not installed. Proceeding with installation."
    sudo apt-get update
    sudo apt-get install git
    echo "Git installed successfully."
else
    echo "Git is already installed."
fi
