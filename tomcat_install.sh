sudo su -
amazon-linux-extras install java-openjdk11
java --version
cd /opt

# wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz
# wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.13/bin/apache-tomcat-10.1.13.tar.gz
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.13/bin/apache-tomcat-10.1.13-deployer.tar.gz

# tar -xvzf apache-tomcat-9.0.78.tar.gz 
# tar -xvzf apache-tomcat-10.1.13.tar.gz 
tar -xzvf apache-tomcat-10.1.13-deployer.tar.gz
mv apache-tomcat-10.1.13 tomcat
cd tomcat/bin
./startup.sh