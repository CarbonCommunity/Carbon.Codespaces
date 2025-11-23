#!/usr/bin/env bash
echo "Updating Carbon Codespaces environment..."

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y ca-certificates curl lib32gcc-s1
sudo useradd -m steam || true
sudo mkdir -p steamcmd
sudo chown -r $USER:$USER steamcmd

cd Server
carbon=https://github.com/CarbonCommunity/Carbon.Core/releases/download/edge_build/Carbon.Linux.Debug.tar.gz
curl -sqL $carbon -o carbon.tar.gz
tar -xvzf carbon.tar.gz
rm carbon.tar.gz

cd ../steamcmd
steamCmd=https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
curl -sqL $steamCmd -o steamcmd_linux.tar.gz
tar -xvzf steamcmd_linux.tar.gz
rm steamcmd_linux.tar.gz
sudo ln -sf steamcmd.sh /usr/local/bin/steamcmd

./steamcmd.sh +force_install_dir "../Server" +login anonymous +app_update 258550 -beta staging validate +quit

echo "Update complete."