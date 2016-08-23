#!/bin/bash

sudo -u fmv git clone https://aur.archlinux.org/qbs.git
cd qbs
sudo -u fmv makepkg
pacman -U --noconfirm qbs*.pkg.tar*
cd ..

sudo -u fmv git clone https://aur.archlinux.org/capnproto.git
cd capnproto
sudo -u fmv makepkg
pacman -U --noconfirm capnproto*.pkg.tar*
cd ..

rm -rf qbs capnproto aur.sh
