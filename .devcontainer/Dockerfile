FROM --platform=linux/amd64 mcr.microsoft.com/devcontainers/base:bookworm

# Sudo apt update needs to run in order for installation of fish to work .
RUN sudo apt update && \
    sudo apt install fish -y
