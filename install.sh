#!/bin/env bash
##### CHECK FOR SUDO or ROOT ##################################
if ! [ $(id -u) = 0 ]; then
  echo "This script must be run as sudo or root, try again..."
  exit 1
fi


# ==================================================================
# RPM FUSION Section https://rpmfusion.org/Configuration
# ==================================================================

dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# ==================================================================
# KDE Base Install
# ==================================================================

dnf install \
  @"KDE Plasma Workspaces" \
  ark \
  gscan2pdf \
  libreoffice \
  vlc \
  kde-connect \
  firefox

# Enable kde boot
systemctl enable sddm
systemctl set-default graphical.target


# ==================================================================
# Applications
# ==================================================================

dnf install \
  freecad \
  keepassxc \
  texmaker \
  syncthing \
  texmaker \
  vlc \
  inkscape \
  gimp \
  gpxsee \
  nmap \
  prusa-slicer \
  mumble \
  rclone \
  rclone-browser \
  kdenlive \
  neofetch \
  rdfind


# ==================================================================
# Nvidia Drivers from RPM Fusion
# ==================================================================

dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda nvidia-settings


# ==================================================================
# VS Code Repo
# ==================================================================

rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf install code


# ==================================================================
# joplin repo
# ==================================================================

dnf copr enable taw/joplin
dnf install joplin
