# SprecherPCtoLinux
Winlaufen Sprecher-PC unter Linux (RaspberryPi) installieren  

## schnelle Installation per Skript
```
# als user pi ausführen
cd ~
mkdir ~/snowgamessources
cd snowgamessources
git clone -v https://github.com/snowgames95/SprecherPCtoLinux
cd SprecherPCtoLinux
sudo chmod +x install.sh
./install.sh
```

## Infos:
### Download
Zuerst das Programm von http://www.winlaufen.de/installwinlaufen2019.htm auf einen Windows-PC herunterladen.  
Dort installieren. Dann den Installationspfad suchen.  
Hier ist es:  
C:\Program Files (x86)\SprecherPC  
Von dort die Java-Datei **SprecherPC.jar** und
die Datei **C:\Program Files (x86)\SprecherPC\jre\bin\javaw** (ist ein Icon) auf den Linux-PC kopieren.  
z.B. ins Verzeichnis: `/home/pi/snowgames`  

> Das Problem ist, das dieses Programm für Windows geschrieben und dabei der Zeichensatz mit ISO-8859-1 festgelegt wurde. Unter Linux wird aber UTF-8 verwendet. Deshalb muss die Java VM beim Start des Programms "Sprecher-PC" angewiesen werden, ein Encoding mit ISO-8859-1 durchzuführen, anstatt den Linux-Standart zu verwenden.

So muss im Terminal das Programm aufgerufen werden, damit auch die deutschen Umlaute richtig angezeigt werden:  
`java -jar -Dfile.encoding=ISO-8859-1 SprecherPC.jar`  

### Icon für Programmstarter verschieben und umbenenen
`sudo mv -v /home/pi/snowgames/javaw.ico /usr/share/pixmaps/sprecherpc.ico` 

### Programmstarter erstellen:  
Die Datei SprecherPC.desktop erstellen:  
`nano /home/pi/.local/share/applications/SprecherPC.desktop`  
dort einfügen:  
```
[Desktop Entry]
Name=SprecherPC
Comment=Startet den Winlaufen Sprecher-PC
Icon=/usr/share/pixmaps/sprecherpc.ico
Exec=java -jar -Dfile.encoding=ISO-8859-1 /home/pi/snowgames/SprecherPC.jar
Type=Application
Terminal=false
Categories=None;
Name[de_DE]=SprecherPC
```

und ausführbar machen 
`sudo chmod +x /home/pi/.local/share/applications/SprecherPC.desktop`  
