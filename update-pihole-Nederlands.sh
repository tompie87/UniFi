#! wget "https://github.com/tompie87/UniFi/raw/master/update-pihole-Nederlands.sh" -O update.sh && chmod +x update.sh && ./update.sh
#! /bin/bash

Kleur='\033[1;31m'
loos='\033[0m'

echo -e "${Kleur}\n\nNu wordt het systeem up-to-date gebracht en worden de oude en niet gebruikte packages verwijderd.\n\n${loos}"
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt-get autoclean -y

if hash pihole 2>/dev/null; then
	echo -e "${Kleur}\n\nPi-hole wordt nu geupdatet.\n\n${loos}"
        pihole -up
fi
