#!/bin/bash
# Maintener: @knilix
# Only test
# Startscript: wget -q -P /opt/ https://github.com/knilix/testareaalpine/archive/refs/heads/main.zip && unzip /opt/main.zip -d /opt/scriptfiles && chmod 700 /opt/scriptfiles/testareaalpine-main/alpineautoupdateinstallscript.sh
# Ausführbefehl: cd && cd /opt/scriptfiles/testareaalpine-main && ./alpineautoupdateinstallscript.sh
cd
#
mkdir -p /opt/scriptfiles
touch /opt/scriptfiles/updatescript.sh
touch /opt/scriptfiles/updatelog.txt
#
echo '#!/bin/bash' | tee -a /opt/scriptfiles/updatescript.sh
echo 'apk update' | tee -a /opt/scriptfiles/updatescript.sh
echo 'apk upgrade' | tee -a /opt/scriptfiles/updatescript.sh
echo 'echo d=$(date +%y-%m-%d_%H:%M:%S) | tee -a /opt/scriptfiles/updatelog.txt' | tee -a /opt/scriptfiles/updatescript.sh
#
chmod 700 /opt/scriptfiles/updatescript.sh
#
cd && cd /opt/scriptfiles
./updatescript.sh
#
rm -r /opt/scriptfiles/testareaalpine-main
rm /opt/main.zip
#
clear
echo #
echo #
echo "- Das Updatescript wurde erstellt"
echo "- Nicht mehr benötigte Installationsdateien wieder gelöscht"
echo "- Folgender Befehl könnte in die 'crontab -e' für ein Update, täglich 02:10 Uhr, am Ende eingefügt werden"
echo #
echo "10 2 * * * /opt/scriptfiles/updatescript.sh >/dev/null 2>&1"
echo #
echo "Manueller Startbefehl:"
echo #
echo "cd && cd /opt/scriptfiles/ && ./updatescript.sh"
echo #
echo #
