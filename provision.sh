# Provisioning control node (ansible)
# ppa = personal package archive

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update

# Installing ansible
sudo apt-get install ansible -y

# Determining node IPs
sudo echo "[web]" >> /etc/ansible/hosts
sudo echo "192.168.10.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant" >> /etc/ansible/hosts
sudo echo "[db]" >> /etc/ansible/hosts
sudo echo "192.168.10.20 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant" >> /etc/ansible.hosts