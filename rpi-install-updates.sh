#!/bin/bash

# Mopidy Installer 1.0.4
# https://github.com/DavisNT/Mopidy-Installer
# Copyright (c) 2016-2022 Davis Mosenkovs
# Licensed under the MIT License (see file LICENSE)

sudo touch /forcefsck
sudo sync

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y autoclean

sudo update-rc.d mopidy enable

sudo SKIP_WARNING=1 BRANCH=stable rpi-update

sudo pip3 install -U Mopidy-Mobile Mopidy-Moped Mopidy-Musicbox-Webclient Mopidy-Websettings Mopidy-Spotify Mopidy-Spotify-Tunigo Mopidy-Youtube Mopidy-Soundcloud Mopidy-Dirble Mopidy-Tunein Mopidy-AlarmClock Mopidy-PlaybackDefaults youtube-dl Mopidy-Iris Mopidy-Local

sudo sync
