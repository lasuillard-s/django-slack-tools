#!/usr/bin/env bash

pipx install pre-commit
pipx install uv

# Add ngrok key
curl -fsSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc \
    && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list

sudo apt-get update && sudo apt-get install -y \
    gettext \
    ngrok
