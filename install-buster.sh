#!/bin/bash

# Mopidy Installer 1.0.1
# https://github.com/DavisNT/Mopidy-Installer
# Copyright (c) 2016-2020 Davis Mosenkovs
# Licensed under the MIT License (see file LICENSE)

# Ensure that script is running as root
if [ `id -u` != "0" ]; then
  echo "This script must be run as root"
  exit 1
fi

# Add Mopidy repository
wget -q -O tmp-mopidy.gpg https://apt.mopidy.com/mopidy.gpg
if ! echo "104f5b5e22a7a5be73963432b044543c2d7d1f63c65612aaa7d9903e135046dd tmp-mopidy.gpg" | sha256sum --check --strict; then
  echo "Security error: https://apt.mopidy.com/mopidy.gpg has wrong SHA256"
  echo "Downloaded file saved as tmp-mopidy.gpg"
  exit 1
fi
apt-key add tmp-mopidy.gpg
rm tmp-mopidy.gpg
wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list
apt-get update

# Install Debian packages
DEBIAN_FRONTEND=noninteractive apt-get -y install python3-pip python3-dev build-essential iptables-persistent mopidy libspotify-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad

# Install Python packages
pip3 install Mopidy-Mobile Mopidy-Moped Mopidy-Musicbox-Webclient Mopidy-Websettings Mopidy-Simple-Webclient Mopidy-Spotify Mopidy-Spotify-Tunigo Mopidy-Youtube Mopidy-Soundcloud Mopidy-Dirble Mopidy-Tunein Mopidy-AlarmClock Mopidy-PlaybackDefaults youtube-dl Mopidy-Iris Mopidy-Local-Sqlite

# Allow shutdown for Mopidy-Websettings
echo "mopidy ALL=(root) NOPASSWD: /sbin/shutdown -h now, /sbin/shutdown -r now" > /etc/sudoers.d/020_mopidy_shutdown

# Add a port mapping
iptables-restore 2>/dev/null < /etc/iptables/rules.v4
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 6680
iptables-save > /etc/iptables/rules.v4

# Create config files
cat > /usr/share/mopidy/conf.d/mopidy-installer.conf <<EOF
[http]
enabled = true
hostname = 0.0.0.0
port = 6680
zeroconf = ""

[musicbox_webclient]
enabled = true
musicbox = true

[websettings]
enabled = true
musicbox = false
config_file = /usr/share/mopidy/conf.d/websettings.conf

EOF
touch /usr/share/mopidy/conf.d/websettings.conf
chown mopidy /usr/share/mopidy/conf.d/*.conf

# Enable and start Mopidy service
update-rc.d mopidy enable
service mopidy start
