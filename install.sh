#!/bin/bash

# Beende das Skript, wenn ein Befehl fehlschlägt
set -e

# Funktion für farbige Ausgaben
info() { echo -e "\033[1;32m[INFO]\033[0m $1"; }
error() { echo -e "\033[1;31m[ERROR]\033[0m $1"; }

info "TigerVNC Viewer wird installiert..."
sudo apt update
sudo apt install -y tigervnc-viewer
info "SSH Server wird installiert"
sudo apt install openssh-server
info "Autostart-Eintrag wird erstellt..."

# Stelle sicher, dass das Autostart-Verzeichnis existiert
AUTOSTART_DIR="$HOME/.config/autostart"
mkdir -p "$AUTOSTART_DIR"

# Autostart-Datei erstellen
AUTOSTART_FILE="$AUTOSTART_DIR/vncviewer.desktop"

cat <<EOF > "$AUTOSTART_FILE"
[Desktop Entry]
Type=Application
Exec=vncviewer -FullScreen=1 -FullScreenMode=all server1
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=TigerVNC Fullscreen zu server1
Comment=Starte VNC-Viewer im Vollbild
EOF

info "Autostart-Eintrag wurde erfolgreich erstellt unter:"
echo "$AUTOSTART_FILE"

info "Fertig."

