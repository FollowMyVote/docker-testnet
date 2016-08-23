#!/bin/bash

pacman -Sy --noconfirm archlinux-keyring
pacman -Su --noconfirm --needed git ninja cmake clang boost python automake autoconf libtool make qt5-base qt5-script sudo fakeroot botan pkg-config python2 npm supervisor
pacman-db-upgrade
update-ca-trust --fresh

pacman -Scc --noconfirm
rm /packages.sh
