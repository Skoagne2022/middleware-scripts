!/bin/bash


    #Author : Sandrine
        #Date : 26-Feb-2022
	    
	## ---------- Description  -----------------

	# Sonarqube installation
	
echo "Installation of Sonarqube below."
echo
echo
echo "step 1: Java installation"
echo
sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
echo
echo
echo "Step 2: Download SonarQube latest versions on your server"
echo
cd /opt
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
echo
echo
echo "Step 3: Extract packages"
echo
sudo yum install unzip -y
sudo unzip /opt/sonarqube-9.3.0.51899.zip01
echo
echo
echo "Step 4: Change ownership to the user and Switch to Linux binaries directory to start service"
echo
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
./sonar.sh start
echo
echo
echo "Step 5: Enable firewall with port 9000"
echo
sudo yum install firewalld -y
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload
echo
echo
echo "Connect to the SonarQube server through the browser using this Url and port."
echo
echo "http://192.168.56.33.9000"
echo
echo "username: admin"
echo "password: admin"
