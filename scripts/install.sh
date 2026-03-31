#!/usr/bin/bash

cd ../
sudo make clean install
sudo cp scripts/vol.sh /usr/local/bin/vol.sh
sudo cp scripts/brightness.sh /usr/local/bin/brightness.sh
sudo chmod +x /usr/local/bin/vol.sh
sudo chmod +x /usr/local/bin/brightness.sh
