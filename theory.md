# Ansible and IAC

## Infrastructure as Code

- Setting up infrastructure (networks, VMs) with source code as opposed to manually.

- Source code is more robust, lack of isolation of scripts (eg provision.sh)

### Configuration Management Tools

- Tools that put IAC into practice with orchestration tools.
- Example SCM Tools:
	- Chef (ruby)
	- Puppet
	- Ansible

### Orchestration Tools

- Configure network and deployment at scale.
- Examples:
	- Ansible
	- Terraform

## Kernel

- Layer between OS and hardware
- Manages operations eg memory / CPU time

## Ansible

- A higher level language, for IAC
- Open source
- Deals with differing environments (powershell vs bash), and package managers
- Abstracts most used commands and operations in provisioning
- Allows us to become infrastructure agnostic (flexibility)
- Increases robustness due to IAS and SCM tools
- Increases ease of use (YAMLs, playbooks)
- Allows for multi and hybrid cloud-premesis-environment management (orchestration)
- Allows us to set up and track several machines such as webserver, db, AWS

## Playbooks

- File(s) that provision and configure agent machines.
- Use YAML language
	- ie Mark Up
	- ie abstracted, human-readable
	- Higher level so therefore more flexible, robust, easier to use with various machines
- Must begin with `---`
- Standard format:

` 
---
hosts:
gather_facts:
become:
tasks:
...
handlers:
`
- `hosts:` declares specific agent(s)
- `gather_facts:` tells ansbile machine to gather the info of its environment
- `become:` used with 'true' to get root permission to perform commands, ie `sudo`
- `tasks:` marks beginning of list of tasks to be set to machine

###### Playbooks - Handlers

- Tasks that will run when called using the `notify` call, within a separate task
- Positioned after main tasks of playbook
