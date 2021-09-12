#!/bin/bash

clear

############################################
# Installation des Winlaufen Sprecher-PC´s #
# als user pi ausführen                    #
############################################

sudo apt update -y && sudo apt upgrade -y
mkdir ~/snowgames
sudo mv -v ~/snowgamessources/SprecherPCtoLinux/javaw.ico /usr/share/pixmaps/sprecherpc.ico
sudo mv -v ~/snowgamessources/SprecherPCtoLinux/SprecherPC.jar ~/snowgames/SprecherPC.jar

cat <<EOF > ~/.local/share/applications/SprecherPC.desktop
[Desktop Entry]
Name=SprecherPC
Comment=Startet den Winlaufen Sprecher-PC
Icon=/usr/share/pixmaps/sprecherpc.ico
Exec=java -jar -Dfile.encoding=ISO-8859-1 /home/pi/snowgames/SprecherPC.jar
Type=Application
Terminal=false
Categories=None;
Name[de_DE]=SprecherPC
EOF

sudo chmod +x /home/pi/.local/share/applications/SprecherPC.desktop
