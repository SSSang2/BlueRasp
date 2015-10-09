#! /bin/bash

echo "Modify build.xml"
sudo sed -i 's/2.1.0-SNAPSHOT/2.1.0/' bluecove-gpl-2.1.0-sources.tar/bluecove-gpl-2.1.0/build.xml

echo "Go into temp folder (/home/pi/temp)"
mkdir temp
cd temp

echo "Copy complete folder bluecove-gpl-2.1.0 including modified build.xml file into folder temp"
sudo cp -r ../bluecove-gpl-2.1.0-sources.tar/bluecove-gpl-2.1.0/ ./

echo "Add new folders bluecove/target into temp (/home/pi/temp/bluecove/target/)"
sudo mkdir -p bluecove/target

echo "sudo cp ../bluecove-2.1.0.jar bluecove/target/"
sudo cp ../bluecove-2.1.0.jar bluecove/target/

echo "Update and install some files"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove
sudo apt-get install bluetooth bluez-utils blueman -y

echo "Check bluetooth status"
/etc/init.d/bluetooth status

echo "Install the BlueZ develop package"
sudo apt-get install libbluetooth-dev

echo "Install Apache Ant"
sudo apt-get install ant -y

echo "Compile"
cd bluecove-gpl-2.1.0/
sudo ant all

echo "use ste jar file with your jar file"
sudo cp ~/temp/bluecove-gpl-2.1.0/target/bluecove-gpl-2.1.0.jar ~/
