

-Introduction

This documentation refers to the installation and configuration of a MySQL and an
Apache WebServer in two different docker containers. Also, we configure a Icinga monitor server as a monitoring solution.
All backup and send docker log files will be sent to Amazon S3.


-Prerequisites

1. Anisble installed in server which is running Playbook - http://docs.ansible.com/ansible/intro_installation.html
2. ssh keys are copied to authorized_keys file.
3. Docker repo add in node which is running docker containers
4. S3 bucket setup with Access and secret key setup.


-Installation Procedure

1. Install git - yum istall git -y

git clone https://github.com/sagarbangera/ansible.git


2. Ansible Ping Test

Navigate to the git repo
$ cd ~
$ cd /root/ansible/Ansible

$ ansible all -m ping #run this command to ensure connection looks good for all nodes.
This will read the server-names which is mentioned in hosts file and does connection  check.
If result is not OK, check whether the id_rsa.pub is copied to authorized_keys file.

result---
localhost | SUCCESS => {
    "changed": false,
    "ping": "pong"

3. Running Ansible

Once you clone the git repository and all hosts are reachable, run the playbook as following:

$ ansible-playbook -v docker_configure_playbook.yml

   - Create environment required to setup Docker.
   - Create httpd and mysql docker containers.
   - Create cron entry to copy files to Amazon S3 bucket.

$ ansible-playbook -v icinga_configure_playbook.yml

   - Setup environment required to setup Icinga monitoring server
   - Install and configure mysql monitoring

$ ansible-playbook -v icingaweb_configure_playbook.yml

   - Create environment required to setup icingaweb
   - Configure monitoring module in icingaweb

4. Access the monitoring dashboard using the below link
http://servername/icingaweb2

5. Access the docker web page using the below link
http://servername:8080

6. Access the default we page using the below link
http://servername

All web pages are password protected
