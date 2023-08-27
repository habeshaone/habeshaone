#!/bin/bash

install_with_apt() {
    local tool=$1
    local package=$2
    echo "Installing $tool..."
    sudo apt-get -qq install -y "$package"
    echo "Installation of $tool complete."
}


install_with_pip() {
    local tool=$1
    local package=$2
    echo "Installing $tool..."
    sudo pip install "$package"
    echo "Installation of $tool complete."
}


is_tool_installed() {
    local tool=$1
    command -v "$tool" >/dev/null 2>&1
}


echo "Advanced Automated Tool Installer"


echo "Installing system tools..."
if ! is_tool_installed curl; then
    install_with_apt "curl" "curl"
fi

if ! is_tool_installed wget; then
    install_with_apt "wget" "wget"
fi

if ! is_tool_installed git; then
    install_with_apt "git" "git"
fi


echo "Installing Python tools..."
if ! is_tool_installed pip; then
    install_with_apt "pip" "python3-pip"
fi

if ! is_tool_installed numpy; then
    install_with_pip "numpy" "numpy"
fi

if ! is_tool_installed pandas; then
    install_with_pip "pandas" "pandas"
fi

if ! is_tool_installed matplotlib; then
    install_with_pip "matplotlib" "matplotlib"
fi

echo "Tool installation complete."