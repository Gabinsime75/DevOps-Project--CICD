sudo su - 
yum install docker -y
systemctl start docker
systemctl enable docker
systemctl status docker
useradd dockeradmin
passwd dockeradmin
usermod -aG docker dockeradmin
vim /etc/ssh/sshd_config
 ( PasswordAuthentication yes )
systemctl restart sshd
# The systemctl restart sshd command is used to restart the OpenSSH server (sshd) on a Linux system. 
# It's a common way to apply configuration changes to the SSH server or to restart the service for other reasons.