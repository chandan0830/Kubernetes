#!/bin/bash
echo " Jenkins install for redhat/centos machine"
echo " Jenkins Installation start...."
sudo dnf install -y tee
sudo dnf install -y java-17-openjdk
sudo curl --silent --location https://pkg.jenkins.io/redhat-stable/jenkins.io.key | gpg --dearmor | sudo tee /etc/pki/rpm-gpg/jenkins.gpg > /dev/null  
sudo tee /etc/yum.repos.d/jenkins.repo > /dev/null <<EOF
[jenkins]
name=Jenkins-stable
baseurl=https://pkg.jenkins.io/redhat-stable
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/jenkins.gpg
EOF
sudo dnf install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
echo " Installation Completed Thank you !! for learning linux+Devops+AWS whatsapp - 7021524284"

echo "use admin password for setup jenkins"

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo " access jenkins from browser ------- "
echo "http://<your-server-ip>:8080"

