cd /opt
wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz
# This command will download the tarball containing Apache Maven 3.9.4 to your current directory. 

tar -xvzf apache-maven-3.9.4-bin.tar.gz
# Extracts the downloaded tarball.

mv apache-maven-3.9.4 maven
# Move the extracted directory "apache-maven-3.9.4" to maven

cd maven/bin
./mvn -v
cd ~
vim .bash_profile
    M2_HOME=/opt/maven
    M2=/opt/maven/bin
    JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.19.0.7-1.amzn2.0.1.x86_64
    PATH=$PATH:$HOME/bin:$JAVA_HOME:$M2_HOME:$M2
            (save it)
source .bash_profile
echo $PATH