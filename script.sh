#!/bin/bash





clear

echo "##################################################################"
echo "#                            Checking For root                    #"
echo "###################################################################"
sleep 3
clear
if (( $EUID != 0 )); then
echo "###########################################################################################"
echo "#                            Please run as root                                           #"
echo "###########################################################################################"
exit
fi

clear
sleep 2

clear
echo "############################################################################"
echo "#                          Press Enter to continue                         #"
echo "############################################################################"
read continuepress
sleep 1
clear
echo "############################################################################"
echo "#                              Installer                                   #"
echo "#                              by COMPLEX.                                  #"
echo "############################################################################"
echo "#                                                                          #"
echo "#     1 | Update Server & Install Nmap                                     #"
echo "#     2 | Install Wget                                                     #"
echo "#     3 | Install Advanced Script                                          #"
echo '#     4 | Install Docker & Docker-Compose                                  #'
echo "#     5 | Install Docker + Yacht                                           #"
echo "#     6 | Install Docker + Portainer                                       #"
echo "#     7 | Install Pihole                                                   #"
echo "#     8 | Install Keyhelp                                                  #"
echo "#     9 | Install AdGuard Home                                             #"
echo "#     10 | Install Node Verion                                             #"
echo "#     11 | Install Nginx                                                   #"
echo "#     12 | Install NextCloud Docker                                        #"
echo "#     13 | Install Php                                                     #"
echo "#     14 | Install PHPMyAdmin                                              #"
echo "#     15 | Install MariaDB                                                 #"
echo "#     16 | Install Sinusbot Docker                                         #"
echo "#     17 | Install Python                                                  #"
echo "#                                                                          #"    
echo "############################################################################"

read -p "Please enter a Number:" installnumber
# Docker Installation
sleep 3
clear
if [ "$installnumber" = "1" ]; then
echo "---------------"
echo "Updating Server"
echo "---------------"

sleep 1



sudo apt update ; sudo apt upgrade -y

sleep 1

clear
echo "---------------"
echo "Downloading Nmap"
echo "---------------"
sleep 1


sudo apt install nmap -y

sleep 1

clear
fi
if [ "$installnumber" = "2" ]; then
echo "-------------"
echo "Insalling wget"
echo "-------------"

sleep 1


sudo apt-get install wget -y

sleep 1
fi
if [ "$installnumber" = "3" ]; then
clear
echo "-------------------------"
echo "Installing Advanced Script"
echo "-------------------------"

sleep 1

clear

wget https://raw.githubusercontent.com/COMPLEX22111/Updated-Of-Tomatos-Script/main/setupServerPackages.sh
echo "-----------------------"
echo "Got Script Runing it now"
echo "-----------------------"
sleep 2

clear 
echo "-------------------------------"
echo "Giving Script Permissions To Run"
echo "-------------------------------"
sleep 2

chmod +rwx setupServerPackages.sh

clear
./setupServerPackages.sh
echo "-------------------"
echo "Deleting script file"
echo "-------------------"
sleep 2
clear
echo "-----------------------"
echo "You Have 5 sec to cancel"
echo "-----------------------"
sleep 5

sudo rm setupServerPackages.sh
fi
if [ "$installnumber" = "4" ]; then
echo "----------------"
echo "Instaling Docker" 
echo "----------------"
sleep 2

clear

sudo apt install docker.io docker-compose -y
fi

if [ "$installnumber" = "5" ]; then
clear
sleep 1
echo "############################################################################"
echo "#                        Installing Docker + Yacht                         #"
echo "############################################################################"
sleep 2
echo "############################################################################"
echo "#                      Server Update (apt update -y)                       #"
echo "############################################################################"
apt update -y
wait -n
echo "############################################################################"
echo "#                      Server Upgrade (apt upgrade -y)                     #"
echo "############################################################################"
apt upgrade -y
wait -n 
echo "############################################################################"
echo "#                 Docker Installation (apt install docker -y)              #"
echo "############################################################################"
apt install docker -y
wait -n 
echo "############################################################################"
echo "#         Docker-Compose Installation (apt install docker-compose -y)      #"
echo "############################################################################"
apt install docker-compose -y
wait -n
echo "############################################################################"
echo "#                 Starting Docker (systemctl start docker)                 #"
echo "############################################################################"
systemctl start docker
wait -n
echo "############################################################################"
echo "#                 Enabling Docker (systemctl enable docker)                #"
echo "############################################################################"
systemctl enable docker
wait -n
echo "############################################################################"
echo "#            Docker Volume Creating (docker volume create yacht)           #"
echo "############################################################################"
docker volume create yacht
wait -n
echo "############################################################################"
echo "#                           Enter the Name & Port                          #"
echo "############################################################################"
read -p "Please enter Yacht Container Name (yacht is recommended): " yachtname
read -p "Please enter Yacht Port1 (8000 is recommended): " yachtport1
echo "############################################################################"
echo "#                Downloading and Installing Yacht Container                #"
echo "############################################################################"
docker run -d -p $yachtport1:$yachtport1 -v /var/run/docker.sock:/var/run/docker.sock -v yacht:/config --name $yachtname selfhostedpro/yacht
wait -n 
clear
echo "############################################################################"
echo "#                     Installed Docker + Yacht                             #"
echo "#                                                                          #"
echo "#      Yacht Name  | $yachtname                                            #"
echo "#      Yacht Port1 | $yachtport1                                           #"
echo "#                                                                          #"
echo "#      Default Login:                                                      #"
echo "#                                                                          #"
echo "#      admin@yacht.local                                                   #"
echo "#      pass                                                                #"
echo "#                                                                          #"
echo "#      After logging in, you should change the Login Datas.                #"
echo "#                                                                          #"
echo "############################################################################"
fi
if [ "$installnumber" = "6" ]; then
clear
sleep 1
echo "############################################################################"
echo "#                      Installing Docker + Portainer                       #"
echo "############################################################################"
sleep 2
echo "############################################################################"
echo "#                      Server Update (apt update -y)                       #"
echo "############################################################################"
apt update -y
wait -n
echo "############################################################################"
echo "#                      Server Upgrade (apt upgrade -y)                     #"
echo "############################################################################"
apt upgrade -y
wait -n 
echo "############################################################################"
echo "#                 Docker Installation (apt install docker -y)              #"
echo "############################################################################"
apt install docker -y
wait -n 
echo "############################################################################"
echo "#         Docker-Compose Installation (apt install docker-compose -y)      #"
echo "############################################################################"
apt install docker-compose -y
wait -n
echo "############################################################################"
echo "#                 Starting Docker (systemctl start docker)                 #"
echo "############################################################################"
systemctl start docker
wait -n
echo "############################################################################"
echo "#                 Enabling Docker (systemctl enable docker)                #"
echo "############################################################################"
systemctl enable docker
wait -n
echo "############################################################################"
echo "#     Docker Volume Creating (docker volume create portainer_data)         #"
echo "############################################################################"
docker volume create portainer_data
wait -n
echo "############################################################################"
echo "#                           Enter the Name & Port                          #"
echo "############################################################################"
read -p "Please enter Portainer Container Name (portainer is recommended): " portainername
read -p "Please enter Portainer Port 1 (8000 is recommended): " portainerport1
read -p "Please enter Portainer Port 2 (9443 is recommended): " portainerport2
echo "############################################################################"
echo "#                Downloading and Installing Portainer Container            #"
echo "############################################################################"
docker run -d -p $portainerport1:$portainerport1 -p $portainerport2:$portainerport2 --name=$portainername --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
wait -n
clear
echo "############################################################################"
echo "#                     Installed Docker + Portainer                         #"
echo "#                                                                          #"
echo "#      Portainer Name  | $portainername                                    #"
echo "#      Portainer Port1 | $portainerport1                                   #"
echo "#      Portainer Port2 | $portainerport2                                   #"
echo "#                                                                          #"
echo "############################################################################"
fi
if [ "$installnumber" = "7" ]; then
clear
echo "############################################################################"
echo "#                            Installing Pi Hole                            #"
echo "############################################################################"
sleep 2
echo "############################################################################"
echo "#                      Server Update (apt update -y)                       #"
echo "############################################################################"
apt update -y
wait -n
echo "############################################################################"
echo "#                      Server Upgrade (apt upgrade -y)                     #"
echo "############################################################################"
apt upgrade -y
wait -n 
echo "############################################################################"
echo "#                 CURL Installation (apt install curl -y)                  #"
echo "############################################################################"
apt install curl -y
wait -n 
echo "############################################################################"
echo "#                     Downloading Pi Hole Installer                        #"
echo "# curl -sSL https://install.pi-hole.net | bash                             #"
echo "############################################################################"
curl -sSL https://install.pi-hole.net | bash
fi
if [ "$installnumber" = "8" ]; then
sleep 1

clear
echo "############################################################################"
echo "#                         Installing Keyhelp                               #"
echo "############################################################################"
sleep 2
echo "############################################################################"
echo "#                      Server Update (apt update -y)                       #"
echo "############################################################################"
apt update -y
wait -n
echo "############################################################################"
echo "#                      Server Upgrade (apt upgrade -y)                     #"
echo "############################################################################"
apt upgrade -y
wait -n 
echo "####################################################################################################"
echo "#                                     Keyhelp Installation                                         #"
echo "#wget https://install.keyhelp.de/get_keyhelp.php -O install_keyhelp.sh ; bash install_keyhelp.sh ; #"
echo "####################################################################################################"
wget https://install.keyhelp.de/get_keyhelp.php -O install_keyhelp.sh ; bash install_keyhelp.sh ;
fi
if [ "$installnumber" = "9" ]; then
clear
echo "############################################################################"
echo "#                         Installing Adguard Home                          #"
echo "############################################################################"
sleep 2
echo "############################################################################"
echo "#                      Server Update (apt update -y)                       #"
echo "############################################################################"
apt update -y
wait -n
echo "############################################################################"
echo "#                      Server Upgrade (apt upgrade -y)                     #"
echo "############################################################################"
apt upgrade -y
wait -n 
echo "############################################################################"
echo "#                 cURL Installation (apt install curl -y)                  #"
echo "############################################################################"
apt install curl -y
wait -n 
echo "###################################################################################################################"
echo "#                                   Downloading Adguard Home Installer                                            #"
echo "# curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v #"
echo "###################################################################################################################"
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v
fi
if [ "$installnumber" = "10" ]; then
clear
echo "###############################################################"
echo "#                     Installing Node Verion 16.17.0          #"
echo "###############################################################"
clear

sleep 1


cd ~




echo "############################################################################"
echo "#                      Server Update (apt update -y)                       #"
echo "############################################################################"

sudo apt update ; sudo apt upgrade -y


 

sleep 1

clear

echo "############################################################################"
echo "#                     Geting soruce (curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -)                       #"
echo "############################################################################"
curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -

echo "############################################################################"
echo "#                     Install Node (sudo apt-get install -y nodejs)        #"
echo "############################################################################"
sudo apt-get install -y nodejs


node -v
fi
if [ "$installnumber" = "11" ]; then
clear
echo "############################################################################"
echo "#                            Installing Nginx                              #"
echo "############################################################################"
sleep 2
echo "############################################################################"
echo "#                      Server Update (apt update -y)                       #"
echo "############################################################################"
apt update -y
wait -n
echo "############################################################################"
echo "#                      Server Upgrade (apt upgrade -y)                     #"
echo "############################################################################"
apt upgrade -y
wait -n
echo "############################################################################"
echo "#                 CURL Installation (apt install curl -y)                  #"
echo "############################################################################"
apt install curl -y 
wait -n
echo "############################################################################"
echo "#                     Downloading Nginx Installer                         #"
echo "# curl -sSL https://nginx.org/keys/nginx_signing.key | apt-key add -     #"
echo "# echo "deb http://nginx.org/packages/mainline/ubuntu/ `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list #"
echo "# echo "deb-src http://nginx.org/packages/mainline/ubuntu/ `lsb_release -cs` nginx" | tee -a /etc/apt/sources.list.d/nginx.list #"
echo "# apt update -y                                                           #"
echo "# apt install nginx -y                                                    #"
echo "############################################################################"
curl -sSL https://nginx.org/keys/nginx_signing.key | apt-key add -
echo "deb http://nginx.org/packages/mainline/ubuntu/ `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list
echo "deb-src http://nginx.org/packages/mainline/ubuntu/ `lsb_release -cs` nginx" | tee -a /etc/apt/sources.list.d/nginx.list
apt update -y
apt install nginx -y
fi
if [ "$installnumber" = "12" ]; then
clear
echo "############################################################################"
echo "#                        Installing Nextcloud Docker                       #"
echo "############################################################################"
sleep 2
echo "############################################################################"
echo "#                       Server Update (apt update -y)                      #"
echo "############################################################################"
apt update -y
wait -n
echo "############################################################################"
echo "#                       Server Upgrade (apt upgrade -y)                    #"
echo "############################################################################"
apt upgrade -y
wait -n 
echo "############################################################################"
echo "#                           Enter the Name & Port                          #"
echo "############################################################################"
read -p "Please enter Nextcloud Container Name (nextcloud recommended): " nextcloudname
read -p "Please enter Nextcloud Port 1 (8080 is recommended): " nextcloudport1
read -p "Please enter Nextcloud Port 2 (80 is recommended): " nextcloudport2
echo "############################################################################"
echo "#            Downloading and Installing Nextcloud Container                #"
echo "############################################################################"
docker run -d -p $nextcloudport1:$nextcloudport2 --name $nextcloudname nextcloud 
wait -n 
clear
echo "############################################################################"
echo "#                     Installed Nextcloud Docker                           #"
echo "#                                                                          #"
echo "#      Nextcloud Name  | $nextcloudname                                    #"
echo "#      Nextcloud Port1 | $nextcloudport1                                   #"
echo "#      Nextcloud Port2 | $nextcloudport2                                   #"
echo "#                                                                          #"
echo "############################################################################"
fi
if [ "$installnumber" = "13" ]; then
clear
echo "############################################################################"
echo "#                            Installing PHP                                #"
echo "############################################################################"
sleep 2
echo "############################################################################"
echo "#                      Server Update (apt update -y)                       #"
echo "############################################################################"
apt update -y
wait -n
echo "############################################################################"
echo "#                      Server Upgrade (apt upgrade -y)                     #"
echo "############################################################################"
apt upgrade -y
wait -n
echo "############################################################################"
echo "#                 CURL Installation (apt install curl -y)                  #"
echo "############################################################################"
apt install curl -y
wait -n
echo "############################################################################"
echo "#                     Downloading PHP Installer                           #"
echo "# curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer #"
echo "############################################################################"
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
fi
if [ "$installnumber" = "14" ]; then
clear
echo "############################################################################"
echo "#                            Installing PHPMyAdmin                        #"
echo "############################################################################"
sleep 2
echo "############################################################################"
echo "#                      Server Update (apt update -y)                       #"
echo "############################################################################"
apt update -y
wait -n
echo "############################################################################"
echo "#                      Server Upgrade (apt upgrade -y)                     #"
echo "############################################################################"
apt upgrade -y
wait -n
echo "############################################################################"
echo "#                 CURL Installation (apt install curl -y)                  #"
echo "############################################################################"
apt install curl -y
wait -n
echo "############################################################################"
echo "#                     Downloading PHPMyAdmin Installer                     #"
echo "# curl -sS https://files.phpmyadmin.net/phpMyAdmin/
echo "# phpMyAdmin-latest-all-languages.tar.gz | tar -xz -C /usr/share/phpmyadmin #"
echo "############################################################################"
curl -sS https://files.phpmyadmin.net/phpMyAdmin/phpMyAdmin-latest-all-languages.tar.gz | tar -xz -C /usr/share/phpmyadmin
fi
if [ "$installnumber" = "15" ]; then
clear
echo "############################################################################"
echo "#                            Installing MariaDB                            #"
echo "############################################################################"
sleep 2
echo "############################################################################"
echo "#                      Server Update (apt update -y)                       #"
echo "############################################################################"
apt update -y
wait -n
echo "############################################################################"
echo "#                      Server Upgrade (apt Sinusbot Docker   upgrade -y)                     #"
echo "############################################################################"
apt upgrade -y
wait -n
echo "############################################################################"
echo "#                 CURL Installation (apt install curl -y)                  #"
echo "############################################################################"
apt install curl -y
wait -n
echo "############################################################################"
echo "#                     Downloading MariaDB Installer                        #"
echo "# curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash #"
echo "############################################################################"
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
fi
if [ "$installnumber" = "16" ]; then
clear
echo "############################################################################"
echo "#                        Installing                      #"
echo "############################################################################"
sleep 2
echo "############################################################################"
echo "#                       Server Update (apt update -y)                      #"
echo "############################################################################"
apt update -y
wait -n
echo "############################################################################"
echo "#                       Server Upgrade (apt upgrade -y)                    #"
echo "############################################################################"
apt upgrade -y
wait -n 
echo "############################################################################"
echo "#                           Enter the Name & Port                          #"
echo "############################################################################"
read -p "Please enter Sinusbot Container Name (sinusbot recommended): " sinusbotname
read -p "Please enter Sinusbot Port 1 (8087 is recommended): " sinusbotport1
echo "############################################################################"
echo "#            Downloading and Installing Sinusbot Container                 #"
echo "############################################################################"
docker run -d -p $sinusbotport1:$sinusbotport1 \ -v scripts:/opt/sinusbot/scripts \ -v data:/opt/sinusbot/data \ --name $sinusbotname sinusbot/docker
wait -n 
clear
echo "############################################################################"
echo "#                     Installed Sinusbot Docker                            #"
echo "#                                                                          #"
echo "#      Sinusbot Name  | $sinusbotname                                      #"
echo "#      Sinusbot Port1 | $sinusbotport1                                     #"
echo "#                                                                          #"
echo "############################################################################"
fi
if [ "$installnumber" = "17" ]; then
clear
echo "############################################################################"
echo "#                         Installing Python                                #"
echo "############################################################################"
sleep 2
echo "############################################################################"
echo "#                      Server Update (apt update -y)                       #"
echo "############################################################################"
apt update -y
wait -n
echo "############################################################################"
echo "#                      Server Upgrade (apt upgrade -y)                     #"
echo "############################################################################"
apt upgrade -y
wait -n 
echo "############################################################################"
echo "#            Python Installation (apt-get install python3.8 -y)            #"
echo "############################################################################"
apt-get install python3.8 -y
wait -n 
echo "############################################################################"
echo "#                         Installed Python                                 #"
echo "############################################################################"
fi
