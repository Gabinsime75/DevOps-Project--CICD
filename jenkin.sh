sudo su -
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
# downloads the Jenkins repository configuration file and save it as /etc/yum.repos.d/jenkins.repo on a Red Hat-based system.

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# This command will download and import the GPG key from the specified URL, allowing your system to verify the authenticity 
# of Jenkins packages from the Jenkins Red Hat Stable repository. After running this command, you'll be able to install and 
# update Jenkins packages on your system with confidence in their integrity.

yum upgrade

## Add required dependencies for the jenkins package
amazon-linux-extras install epel
# command is used on Amazon Linux 2 to enable, disable, or install software collections, also known as "extras." 
# In this case, you want to install the Extra Packages for Enterprise Linux (EPEL) repository, which provides 
# additional packages not included in the default Amazon Linux repositories.

amazon-linux-extras install java-openjdk11
# This command will install the OpenJDK 11 package from the Amazon Linux Extras repository.

## Install Jenkins
yum install jenkins -y
systemctl enable jenkins
systemctl start jenkins
systemctl status jenkins

# Install git
yum install git -y