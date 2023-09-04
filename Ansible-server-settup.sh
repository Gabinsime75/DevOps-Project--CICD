sudo su -
useradd ansadmin
passwd ansadmin
vim /etc/ssh/sshd_config
   PasswordAuthentication yes 
visudo
   ansadmin        ALL=(ALL)       NOPASSWD: ALL 
systemctl restart sshd
sudo su - ansadmin
ssh-keygen

sudo su -
amazon-linux-extras install ansible2 -y
python --version
ansible --version

## Connect to Docker host terminal
sudo su -
useradd ansadmin
passwd ansadmin
visudo
  ansadmin        ALL=(ALL)       NOPASSWD: ALL 
  
## Go to the Ansible terminal
sudo su -
vim /etc/ansible/hosts
Clear everything in this file and add this :-
[docker]
< docker private ip >
(save it)

sudo su - ansadmin
ssh-copy-id < docker private ip >
ansible all -m ping

## Integrate Ansible with Jenkins
Jenkins -> Manage Jenkins -> System -> Pubish Over SSH -> Add -> SSH Server -> 
Give Name (ansible-server)-> Hostname : < ansible private ip address > -> 
Username : ansadmin -> Advanced -> enable password authentication -> 
Password : ( give the password of ansadmin ) -> Test Configuration.

## create the jenkins job
Jenkins -> New item -> Name : copyartifactstoansible -> Copy from : buildanddeployjoboncontainer -> OK

## Go to Ansible server terminal
sudo su - ansadmin
cd /opt
sudo mkdir docker
sudo chown ansadmin:ansadmin docker


Jenkins -> Dashboard -> buildanddeployjoboncontainer -> General -> give a description -> Post-build Action -> 
SSH Server -> Name : select the name that given for ansible (ansible-server) -> Clear the column of Exec Command -> Apply -> Save

## Go to Ansible server terminal
sudo yum install docker -y
sudo usermod -aG docker ansadmin
sudo systemctl enable --now docker
cd /opt/docker
vim Dockerfile
    FROM tomcat:latest
    RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
    COPY ./*.war /usr/local/tomcat/webapps
sudo chmod 777 /var/run/docker.sock

sudo vim /etc/ansible/hosts
    [docker]
    < docker private ip >

     [ansible]
    < ansible private ip >

(save it)

ssh-copy-id < ansible private ip >
sudos u - ansadmin
docker login

## Enter Username and Password of Dockerhub account to login
cd /opt/docker
vim regapp.yml
    ---
    - hosts: ansible
      tasks:
        - name: create docker image
          command: docker build -t regapp:latest .
          args:
            chdir: /opt/docker
        - name: create tag to push image onto dockerhub
          command: docker tag regapp:latest jabirdocker/regapp:latest
        - name: push docker image
          command: docker push jabirdocker/regapp:latest

(save it)

ansible-playbook regapp.yml --check

vim deploy_regapp.yml
    ---
    - hosts: docker
      tasks:
        - name: stop existing container
          command: docker stop regapp-server
          ignore_errors: yes
        - name: remove the container
          command: docker rm regapp-server
          ignore_errors: yes
        - name: remove image
          command: docker rmi jabirdocker/regapp:latest
          ignore_errors: yes
        - name: create container
         command: docker run -d --name regapp-server -p 8082:8080 jabirdocker/regapp:latest

ansible-playbook deploy_regapp.yml --check

## Go to Docker host terminal
sudo su -
chmod 777 /var/run/docker.sock

Jenkins -> Dashboard -> buildanddeployjoboncontainer -> Configuration -> 
Post-build Action -> SSH Server -> Exec commad : Enter the following command in the Exec command

ansible-playbook /opt/docker/regapp.yml;
sleep;
ansible-playbook /opt/docker/deploy_regapp.yml

## Go to Gitbash terminal
Change the background color in the index.jsp file commit and push it.

Go to  Jenkins and see that a new build is started
check Dockerhub account for the artifact
check Docker host and make sure you  can see the new image and container is created

Go to the webapp and see the change.






