#!/usr/bin/env bash

sudo apt update
sudo apt install gnome-tweak-tool

dconf write /org/gnome/shell/favorite-apps "['google-chrome.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'code.desktop', 'slack_slack.desktop', 'Gmail.desktop', 'Google Calendar.desktop']"
