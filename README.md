# sportlink-knvb-docker

Het doel van dit project is om [Sportlink](https://www.sportlink.nl/) te kunnen draaien op Linux. 
Sportlink gebruikt een oude versie van java (java8) en java webstart. Hiervoor gebruiken we 
[Docker](https://www.docker.com/). De `Dockerfile` bouwt een container, die je vervolgens kun 
runnen. Door gebruik te maken van X11 zal het scherm zichbaar zijn in de Linux hostmachine. 
Mogelijk dat dit ook werkt op Mac, maar dat heb ik niet getest. Garantie tot de deur ;-).

Inspiratie komt van 
https://medium.com/@SaravSun/running-gui-applications-inside-docker-containers-83d65c0db110
MacOs gebruikers zouden hier kunnen kijken: 
https://medium.com/@mreichelt/how-to-show-x11-windows-within-docker-on-mac-50759f4b65cb (en dan
misschien een pull request maken?
)

Voor MacOS installeer je XQuartz:

- brew install xquartz
- Bij settings (onder Security) zet je "Allow connections from network clients aan
- Reboot
- Voer dit nog uit op de command line: `xhost +locahost`

## Vereisten

Bash en Docker zijn nodig, git is handig.

## Installatie

Als je geen git hebt, 
[download](https://github.com/vrolijken/sportlink-knvb-docker/archive/master.zip) dan dit project 
en pak het ergens uit. Als je wel git hebt, clone dan deze repository: 

```
git clone https://github.com/vrolijken/sportlink-knvb-docker.git
cd sportlink-knvb-docker
```

Bouw daarna de container:

```
docker build --tag sportlink-knvb:1.0 .
```

## Werken

Om het makkelijk te maken is het volgende shellscript toegevoegd dat in een terminal uitgevoerd
kan worden: 

```
./sportlink-knvb.sh
```

## Als het niet werkt

De directory 'config' moet bestaan in de huidige werkdirectory en lees- en schrijfbaar zijn:

```
ls -ld config
```
moet zoiets al uitvoer geven: 

```
drwxrwxr-x 5 <jouw gebruiker> <jouw groep> 4096 <datum-tijd> config

```

Verder kun je debuggen door een interactive terminal te starten:

```
docker run -i -t --rm --net=host --env="DISPLAY" \
  --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
  --volume="$(pwd)/config:/home/sportlink/.config/icedtea-web" \
  --volume="$(pwd)/cache:/home/sportlink/.cache/icedtea-web" \
  sportlink-knvb:1.0 /bin/bash

```

* commando `javaws` zou je de versie moeten geven en eventuele hints over waarom het niet werkt
* commando `exit` om hieruit te komen