# Quick Start
This repository contains ansible roles to bootstrap a Linux machine.  

```
quick-start
├── LICENSE
├── README.md
├── ansible.cfg
├── inventory
│   ├── host.yaml
│   └── group_vars
│       └── all
│           └── preparing.yaml
├── playbooks
│   └── preparing.yaml
└── roles
    └── preparing_server
        ├── defaults
        │   └── main.yaml
        ├── files
        │   ├── limits.conf
        │   ├── motd_extension
        │   └── ssh_banner
        ├── handlers
        │   └── main.yaml
        ├── tasks
        │   ├── auditd.yml
        │   ├── fstab.yml
        │   ├── hardening.yaml
        │   ├── hosts.yml
        │   ├── journalconf.yml
        │   ├── limits.yml
        │   ├── main.yaml
        │   ├── mirror.yaml
        │   ├── packages.yaml
        │   ├── resolvedconf.yml
        │   └── tuning.yaml
        └── templates
            ├── coredump.conf.j2
            ├── fail2ban.j2
            ├── hardening.rules.j2
            ├── hosts.allow.j2
            ├── hosts.deny.j2
            ├── hosts.j2
            ├── iptables.j2
            ├── journald.conf.j2
            ├── limits.conf.j2
            ├── logrotate.conf.j2
            ├── resolv.conf.j2
            ├── resolved.conf.j2
            ├── sources.list.j2
            ├── sshd_config.j2
            └── timout.j2
```


## Usage
To run the playbook, check the `inventory/host.yaml` and variables under `inventory/group_vars/` (plus role-specific vars).  
Run the playbook:
```bash
ansible-playbook -i inventory/host.yaml playbooks/preparing.yaml
```


**NOTE:** Tasks in the [Preparing Server Role](./roles/preparing_server/) are mainly adapted from **[Devops Certification Repo](https://github.com/AhmadRafiee/DevOps_Certification)**, licensed under Apache-2.0.
