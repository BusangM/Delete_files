#! /bin/bash


for file in "Documents" "Desktop" "Downloads"
do
    rm -r $HOME/$file/*
    echo "Deleting contents in $file"
done

#Reseting firefox
#! /bin/bash

# Reset Firefox
echo "Resetting Firefox..."
rm -rf $HOME/.mozilla/firefox/*
echo "Done resetting Firefox."

# Reset Brave and installing
if command -v brave-browser >/dev/null; then
  echo "Resetting Brave..."
  rm -rf $HOME/.config/BraveSoftware/
  echo "Done resetting Brave."
else
  echo "Brave not found. Attempting to install..."
  sudo apt-get update
  sudo apt-get install brave-browser -y
  echo "Brave installed. Please run the script again to reset."
fi

# Reset Google Chrome and installing
if command -v google-chrome >/dev/null; then
  echo "Resetting Google Chrome..."
  rm -rf $HOME/.config/google-chrome/
  echo "Done resetting Google Chrome."
else
  echo "Google Chrome not found. Attempting to install..."
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
  sudo apt-get update
  sudo apt-get install google-chrome-stable -y
  echo "Google Chrome installed. Please run the script again to reset."
fi


echo "All done!"





