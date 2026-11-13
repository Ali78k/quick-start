# The cloud image all systems come from - downloaded once, used mulotiple times.
resource "proxmox_download_file" "debian_cloud" {
  content_type = "import"
  datastore_id = "local"
  node_name    = var.proxmox_node

  url       = "https://cloud.debian.org/images/cloud/trixie/latest/debian-13-generic-amd64.qcow2"
  file_name = "debian-13-generic-amd64.qcow2"
  overwrite = false
}

# Six systems of the same kind, differing only in name, ID and resources.
locals {
  machines = {
    kw1-debian13 = { vm_id = 205, ipv4 = "192.168.1.25/24", memory = 2048, cpus = 2, disk = 15 }
    kw2-debian13 = { vm_id = 206, ipv4 = "192.168.1.26/24", memory = 4096, cpus = 2, disk = 15 }
    kw3-debian13 = { vm_id = 207, ipv4 = "192.168.1.27/24", memory = 2048, cpus = 2, disk = 15 }
    km1-debian13 = { vm_id = 200, ipv4 = "192.168.1.20/24", memory = 2048, cpus = 2, disk = 20 }
    km2-debian13 = { vm_id = 201, ipv4 = "192.168.1.21/24", memory = 2048, cpus = 2, disk = 20 }
    km3-debian13 = { vm_id = 202, ipv4 = "192.168.1.22/24", memory = 2048, cpus = 2, disk = 20 }
  }
}

resource "proxmox_virtual_environment_vm" "machine" {
  for_each = local.machines

  node_name = var.proxmox_node
  vm_id     = each.value.vm_id
  name      = each.key

  cpu {
    cores = each.value.cpus
    type  = "host"
  }

  memory {
    dedicated = each.value.memory
  }

  disk {
    datastore_id = "hdd"
    import_from  = proxmox_download_file.debian_cloud.id
    interface    = "scsi0"
    size         = each.value.disk
  }

  initialization {
    datastore_id      = "hdd"
    user_data_file_id = proxmox_virtual_environment_file.cloud_init[each.key].id

    ip_config {
      ipv4 {
        address = each.value.ipv4
        gateway = "192.168.1.1"
      }
    }
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
}

