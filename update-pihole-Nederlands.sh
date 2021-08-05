#! /bin/bash

Kleur='\033[1;31m'
loos='\033[0m'

echo -e "${Kleur}Met dit script wordt je systeem, Pi-hole upgedatet.\n${loos}"
read -p "Typ de gewenste Stabiele UniFi Controller versie (bijv. 6.0.43) of druk op ENTER voor versie 6.1.71: " version

if [[ -z "$version" ]]; then
	version='6.1.71'
fi

echo -e "${Kleur}\n\nNu wordt het systeem up-to-date gebracht en worden de oude en niet gebruikte packages verwijderd.\n\n${loos}"
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt-get autoclean -y

if hash pihole 2>/dev/null; then
	echo -e "${Kleur}\n\nPi-hole wordt nu geupdatet.\n\n${loos}"
        pihole -up
fi
