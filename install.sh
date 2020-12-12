#!/bin/env bash
##### CHECK FOR SUDO or ROOT ##################################
if ! [ $(id -u) = 0 ]; then
  echo "This script must be run as sudo or root, try again..."
  exit 1
fi


# ==================================================================
# RPM FUSION Section https://rpmfusion.org/Configuration
# ==================================================================

dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf copr enable taw/joplin


# ==================================================================
# KDE Base Install
# ==================================================================

dnf install -y \
  @"KDE Plasma Workspaces" \
  ark \
  gscan2pdf \
  libreoffice \
  vlc \
  kde-connect \
  firefox \
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
  rdfind \
  akmod-nvidia \
  xorg-x11-drv-nvidia-cuda \
  nvidia-settings \
  code \
  joplin \
  tesseract-langpack-deu \
  sane-backends-drivers-scanners \
  hunspell-de \
  okular \
  vim \
  htop \
  git

# Enable kde boot
systemctl enable sddm
systemctl set-default graphical.target
