#!/bin/bash
#add fix to exercise5-server2 here
#adding to host file because proviosion script of exersise 4 run after 5
sudo echo "192.168.100.10 server1" >> /etc/hosts
sudo apt-get install sshpass


sudo ssh-keygen -t rsa -f /root/.ssh/id_rsa -N "" <<< y && chmod 600 /root/.ssh/id_rsa && chmod 644 /root/.ssh/id_rsa.pub
sudo ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -N "" <<< y && sed -i s/'root'/'vagrant'/ /home/vagrant/.ssh/id_rsa.pub && chmod 600 /home/vagrant/.ssh/id_rsa && chmod 644 /home/vagrant/.ssh/id_rsa.pub && chown vagrant /home/vagrant/.ssh/id_rsa && chown vagrant /home/vagrant/.ssh/id_rsa.pub 


sudo ssh-keyscan server1 >> /root/.ssh/known_hosts && chmod 644 /root/.ssh/known_hosts
sudo ssh-keyscan server1 >> /home/vagrant/.ssh/known_hosts && chmod 644 /home/vagrant/.ssh/known_hosts && chown vagrant /home/vagrant/.ssh/known_hosts

#sudo /usr/bin/sshpass -p 'vagrant' ssh-copy-id -i /root/.ssh/id_rsa.pub root@server1


sudo cat /root/.ssh/id_rsa.pub | sudo sshpass -p 'vagrant' ssh root@server1 "mkdir -p /root/.ssh && chmod 700 /root/.ssh && cat >> /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys"
sudo cat /home/vagrant/.ssh/id_rsa.pub | sudo sshpass -p 'vagrant' ssh root@server1 "mkdir -p /home/vagrant/.ssh && chmod 700 /home/vagrant/.ssh && chown vagrant /home/vagrant/.ssh && cat >> /home/vagrant/.ssh/authorized_keys && chmod 600 /home/vagrant/.ssh/authorized_keys"

ssh root@server1 "ssh-keygen -t rsa -f /root/.ssh/id_rsa -N '' <<< y && chmod 600 /root/.ssh/id_rsa && chmod 644 /root/.ssh/id_rsa.pub"
ssh root@server1 "ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -N '' <<< y && sed -i s/'root'/'vagrant'/ /home/vagrant/.ssh/id_rsa.pub && chmod 600 /home/vagrant/.ssh/id_rsa && chmod 644 /home/vagrant/.ssh/id_rsa.pub && chown vagrant /home/vagrant/.ssh/id_rsa && chown vagrant /home/vagrant/.ssh/id_rsa.pub"


ssh root@server1 "ssh-keyscan server2 >> /root/.ssh/known_hosts && chmod 644 /root/.ssh/known_hosts"
ssh root@server1 "ssh-keyscan server2 >> /home/vagrant/.ssh/known_hosts && chmod 644 /home/vagrant/.ssh/known_hosts && chown vagrant /home/vagrant/.ssh/known_hosts"

ssh root@server1 "cat /root/.ssh/id_rsa.pub" >> /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys
ssh root@server1 "cat /home/vagrant/.ssh/id_rsa.pub" >> /home/vagrant/.ssh/authorized_keys && chmod 600 /home/vagrant/.ssh/authorized_keys && chown vagrant /home/vagrant/.ssh/authorized_keys

