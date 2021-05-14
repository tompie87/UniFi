#! /bin/bash

Kleur='\033[1;31m'
loos='\033[0m'

read -p "Typ de gewenste Stabiele UniFi Controller versie (bijv. 6.0.43) of druk op ENTER voor versie 6.1.71: " version

if [[ -z "$version" ]]; then
	version='6.1.71'
fi

echo -e "${Kleur}\n\nNu wordt de UniFi Controller met versie $version gedownload.\n\n${loos}"
wget http://dl.ui.com/unifi/$version/unifi_sysvinit_all.deb -O unifi_$version\_sysvinit_all.deb

echo -e "${Colour}\n\nVooraleer de UniFi controller geïnstalleerd wordt, dient Java (OpenJDK 8) geïnstalleerd te worden.\n\n${less}"
sudo apt install openjdk-8-jre-headless -y

echo -e "${Colour}\n\nOm een oplossing te bieden voor de trage opstart van de UniFi controller door een specifiek probleem, wordt haveged geïnstalleerd.\n\n${less}"
sudo apt install haveged -y

echo -e "${Kleur}\n\nDe UniFi controller wordt nu geïnstalleerd.\n\n${loos}"
sudo dpkg -i unifi_$version\_sysvinit_all.deb; sudo apt install -f -y
 
