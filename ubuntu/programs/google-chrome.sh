#!/usr/bin/env bash

# https://www.ubuntuupdates.org/ppa/google_chrome

echo "Installing Google Chrome"

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install google-chrome-stable

# Create desktop shortcuts
## Gmail
echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Gmail
Exec=/opt/google/chrome/google-chrome --profile-directory=Default --app-id=pjkljhegncpnkpknbcohdijeoejaedia
Icon=chrome-pjkljhegncpnkpknbcohdijeoejaedia-Default
StartupWMClass=crx_pjkljhegncpnkpknbcohdijeoejaedia
" > ~/.local/share/applications/Gmail.desktop

## Google Calendar
echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Google Calendar
Exec=/opt/google/chrome/google-chrome --profile-directory=Default --app-id=lfmdmmfbcklncebimlhmgbpnmnjgecpe
Icon=chrome-lfmdmmfbcklncebimlhmgbpnmnjgecpe-Default
StartupWMClass=crx_lfmdmmfbcklncebimlhmgbpnmnjgecpe
" > ~/.local/share/applications/Google\ Calendar.desktop

