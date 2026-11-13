#cloud-config
hostname: ${hostname}
fqdn: ${hostname}
manage_etc_hosts: true

package_update: true
packages:
  - htop

users:
  - name: user
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    ssh_authorized_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFcZqud6sfZKr2UqdjZ1WaBQsTRnWgG8W0uLvZ1+0XyI terraform
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPwFpgkYnf6bdERBhxXdPYkpCUrGrbT7vTs1jPWQAX31 farnam@Abbas

chpasswd:
  expire: false
  users:
    - name: user
      password: "${password}"
      type: text
