        ##CLINT CONFIGERATION ###
-------------------------------------------------
# to change hostname
nmtui
exec bash
#to install nfs utils
yum install -y nfs-utils
#find ip
 ifconfig
#start and enable
systemctl start nfs-server
systemctl enable nfs-server
systemctl status nfs-server
#install auto fs for automatic mounting
yum install -y autofs
#start and enable
systemctl enable autofs
systemctl start autofs
systemctl enable autofs
systemctl status autofs
#make mount folder 
mkdir /mnt/mount
#edit config file
vim /etc/auto.master.d/new.autofs
vim /etc/auto.misc
#after editing config file restart service
systemctl restart nfs-server
systemctl restart autofs
#to access nfs shared dir
cd /mnt/mount


### SERVER CONFIGERATION  #######
-----------------------------------
#change host name
nmtui
exec bash
#install nfs and start+enable
yum install -y nfs-utils
systemctl start nfs-server
systemctl enable nfs-server
#for shareing a dir.make one
mkdir /myfiles
touch /myfiles/file
touch /myfiles/file1
#specify nfs shareing dir location
vim /etc/exports
#restart nfs
systemctl restart nfs-server
#export details
exportfs -rv
#ip address
ifconfig
#change ownership to nobody for access from clint
chown nobody /myfiles

