#!/bin/bash

# Install system-level dependencies
apt-get update
apt-get install -y build-essential ta-lib

# Install Python dependencies
pip install -r requirements.txt