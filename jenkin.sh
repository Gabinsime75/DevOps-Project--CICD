sudo su -
wget -O /etc/yum.repos.d/jenkins.repo \https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum upgrade
# Add required dependencies for the jenkins package
amazon-linux-extras install epel
amazon-linux-extras install java-openjdk11
yum install jenkins
systemctl enable jenkins
systemctl start jenkins
systemctl status jenkins
yum install git