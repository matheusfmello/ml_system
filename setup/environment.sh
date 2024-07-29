#!/bin/bash

# Define environment name and requirements file
ENV_NAME="ml_system"
REQUIREMENTS_FILE="setup/requirements.txt"

# Check if the environment exists
if conda info --envs | grep -q "^$ENV_NAME\s"; then
  echo "Environment '$ENV_NAME' exists. Removing it..."
  conda remove --name $ENV_NAME --all -y
fi

# Create the environment
echo "Creating environment '$ENV_NAME'..."
conda create --name $ENV_NAME python=3.10 -y

# Activate the environment
echo "Activating environment '$ENV_NAME'..."
source activate $ENV_NAME

# Install packages from requirements file using pip
if [[ -f "$REQUIREMENTS_FILE" ]]; then
  echo "Installing packages from '$REQUIREMENTS_FILE'..."
  pip install -r $REQUIREMENTS_FILE
else
  echo "Requirements file '$REQUIREMENTS_FILE' not found. No packages installed."
fi

echo "Environment '$ENV_NAME' is ready."
