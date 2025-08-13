##SERVER CONFIG ####
--------------------

# Change hostname (interactive)
sudo nmtui
exec bash

# Install NFS server utilities
sudo yum install -y nfs-utils

# Start and enable NFS server
sudo systemctl enable --now nfs-server
sudo systemctl status nfs-server

# Create directory to share
sudo mkdir -p /myfiles
sudo touch /myfiles/file /myfiles/file1

# Edit /etc/exports to specify NFS sharing (example)
# Example line: /myfiles nfs-client-ip(rw,sync,no_root_squash,no_subtree_check)

# Apply export changes
sudo exportfs -rv

# Restart NFS server to apply changes
sudo systemctl restart nfs-server

# Check IP address (if ifconfig not available, use ip a)
ifconfig || ip a

# (Optional) Change ownership if needed
# sudo chown nobody:nobody /myfiles



### CLIENT CONFIG ####
------------------------

# Change hostname (interactive)
sudo nmtui
exec bash

# Install necessary packages
sudo yum install -y nfs-utils autofs

# Check IP address (if ifconfig not available, use ip a)
ifconfig || ip a

# Start and enable autofs (no need to start nfs-server on client)
sudo systemctl enable --now autofs
sudo systemctl status autofs

# Create mount point
sudo mkdir -p /mnt/mount

# Edit /etc/auto.master.d/new.autofs (example)
# Example content: /mnt/mount /etc/auto.misc

# Edit /etc/auto.misc to add mount (example)
# Example line: nfs_share -rw,soft,intr nfs-server-ip:/myfiles

# After editing config files, restart services
sudo systemctl restart autofs

# To access NFS shared directory
cd /mnt/mount
ls