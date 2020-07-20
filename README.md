# Setting up Ansible with Vagrant (from level 0)

1) Vagrant init
	- Creates 'blank' Vagrantfile
2) Write Vagrantfile (for full version see example Vagrantfile

```
Vagrant.config ("2") do |config|

...
	
  app.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbook.yml"
  end

...
```

3) `$touch playbook.yml`
4) Write playbook

```
---

- host: [APP]
  remote_user: [SUDO]
  become: true
  task:
  - name: ensure nginx is at the latest version
    apt:
      name: nginx
      state: latest
  - name: start nginx
    service: 
      name: nginx
      state: started
    become: yes
  - name: copy in app folder
    copy:
      src: ./app/
      dest: /home/ubuntu/app-from-playbook/
```

4) vagrant up

## Manual provisioning of Ansible Machine (for automation see provision.sh)


5) `$cd /etc/ansible`
6) Enter agent IPs:  `$sudo nano hosts`:
```
  [web]
  192.168.10.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
  [db]
  192.168.10.20 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
```
7) Test connection:   `$ansible all -m ping`
8) `$ssh-keygen`

## Password Creation WITHIN Each Agent Machine

9) `$cd etc/ssh`
10) `$sudo nano sshd_config`
  - Make `PermitRootLogin yes`
  - Make `PasswordAuthentication yes`
11) `$sudo service ssh restart`
12) `$sudo passwd root`
  - Enter new password: "Vagrant"

## Applying SSH Links (Ansible Machine)

13) `$cd /home/vagrant/.ssh`
14) `$ssh-copy-id root@[Agent IP]`
  - Enter password ("Vagrant")
15) Attempt login with `ssh 'root@[Agent IP]'`

## Running Playbook

16) `$cd /vagrant`
17) `$ansible-playbook playbook.yml`
