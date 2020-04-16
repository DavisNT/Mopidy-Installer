Mopidy Installer
===============
Script for installing [Pi MusicBox](https://www.pimusicbox.com/)-like [Mopidy](https://mopidy.com/) environment on [Raspbian](https://www.raspberrypi.org/downloads/raspbian/). 

Version 1.0.2

Copyright (c) 2016-2020 Dāvis Mošenkovs

## Introduction

This script allows to install a [Pi MusicBox](https://www.pimusicbox.com/)-like [Mopidy](https://mopidy.com/) environment on almost-any Raspbian/Debian Buster inslallation.

The installed environment provides most, but not all, functionality of [Pi MusicBox](https://www.pimusicbox.com/), however the installation does not relax default OS security level (the way it is relaxed on Pi MusicBox).

Script `install-buster.sh` should be usable on other computers (non-Raspberry Pi systems) running Debian Buster as well.

Script `rpi-install-updates.sh` is Raspberry Pi specific.

## Usage

To install Mopidy environment on a new Raspberry Pi:

1. Download Raspbian Buster Lite (or other Buster version if needed).
1. Install Raspbian, configure audio output, shell access etc.
1. Don't forget to set time zone if alarm clock will be used.
1. Download these scripts and run `sudo ./install-buster.sh`


To install Mopidy environment on an existing Raspbian Buster installation:

1. Download these scripts and run `sudo ./install-buster.sh`


To update already installed environment, including Raspbian updates (and Raspberry Pi specific updates):

1. Run `./rpi-install-updates.sh`
1. Reboot

## Notices

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
