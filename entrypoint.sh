#!/bin/bash

# Source the config file
source /config.sh

export PACKAGE_NAME=$IMAGE_NAME

# Set PYTHONPATH
export PYTHONPATH=/app

# Function to install package in editable mode if needed
pip install -e $IMAGE_NAME

case "$1" in
  jupyter)
    jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root
    ;;
  dash)
    python -m $IMAGE_NAME.web.app --host 0.0.0.0 --port 8050
    ;;
  flask)
    flask run --host=0.0.0.0 --port=5000
    ;;
  bash)
    /bin/bash
    ;;
  *)
    echo "Usage: $0 {jupyter|dash|flask|bash}"
    exit 1
esac