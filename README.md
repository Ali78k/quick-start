# Quick Start
This repository contains ansible roles to bootstrap a Linux machine.  

```
quick-start
├── LICENSE
├── README.md
├── configuration
│   ├── ansible.cfg
│   ├── inventory
│   │   ├── group_vars
│   │   │   └── all
│   │   │       ├── docker.yaml
│   │   │       └── preparing.yaml
│   │   └── host.yaml
│   ├── playbooks
│   │   └── preparing.yaml
│   └── roles
│       ├── docker
│       │   ├── handlers
│       │   │   └── main.yaml
│       │   ├── tasks
│       │   │   ├── configure_docker.yaml
│       │   │   ├── install_docker.yaml
│       │   │   ├── main.yaml
│       │   │   └── post_installation.yaml
│       │   └── templates
│       │       └── docker-service.j2
│       └── preparing_server
│           ├── defaults
│           │   └── main.yaml
│           ├── files
│           │   ├── limits.conf
│           │   ├── motd_extension
│           │   └── ssh_banner
│           ├── handlers
│           │   └── main.yaml
│           ├── tasks
│           │   ├── auditd.yml
│           │   ├── fstab.yml
│           │   ├── hardening.yaml
│           │   ├── hosts.yml
│           │   ├── journalconf.yml
│           │   ├── limits.yml
│           │   ├── main.yaml
│           │   ├── mirror.yaml
│           │   ├── packages.yaml
│           │   ├── resolvedconf.yml
│           │   └── tuning.yaml
│           └── templates
│               ├── coredump.conf.j2
│               ├── fail2ban.j2
│               ├── hardening.rules.j2
│               ├── hosts.allow.j2
│               ├── hosts.deny.j2
│               ├── hosts.j2
│               ├── iptables.j2
│               ├── journald.conf.j2
│               ├── limits.conf.j2
│               ├── logrotate.conf.j2
│               ├── resolv.conf.j2
│               ├── resolved.conf.j2
│               ├── sources.list.j2
│               ├── sshd_config.j2
│               └── timout.j2
└── provision
    ├── machine.yaml.tpl
    ├── main.tf
    ├── output.tf
    ├── password.tf
    ├── providers.tf
    ├── startscript.tf
    ├── terraform.tfvars.example
    ├── variables.tf
    ├── versions.tf
    └── vms.tf
```


## Usage
### Terraform `./provision`
```bash
cd ./provision
```
This is an example to provision six Debian VMs in a proxmox hypervisor. You can make changes in it through `vms.tf` file.  
`startscript.tf` uses `machin.yaml.tpl` template to fill values related to `cloudinit`. These values are `hostname`, `username`, and `ssh_authorized_keys`.  
To run `terraform` or `tofu` commands, simply create `terraform.tfvars` based on `terraform.tfvars.example` and your values. Then:

```bahs
tofu fmt
tofu validate
tofu init
tofu plan
tofu apply
```


### Ansible Playbook `./configuration`
```bash
cd ./configuration
```
To run the playbook, check the `inventory/host.yaml` and variables under `inventory/group_vars/` (plus role-specific vars).  
Run the playbook:
```bash
ansible-playbook -i inventory/host.yaml playbooks/preparing.yaml
ansible-playbook -i inventory/host.yaml playbooks/preparing.yaml --tags docker
```


**NOTE:** Tasks in the [Preparing Server Role](./roles/preparing_server/) are mainly adapted from **[Devops Certification Repo](https://github.com/AhmadRafiee/DevOps_Certification)**, licensed under Apache-2.0.
