resource "proxmox_virtual_environment_file" "cloud_init" {
  for_each = local.machines

  node_name    = var.proxmox_node
  datastore_id = "local"
  content_type = "snippets"

  source_raw {
    file_name = "${each.key}-cloud-init.yaml"

    data = templatefile("${path.module}/machine.yaml.tpl", {
      hostname = each.key
      password = random_password.root.result
    })
  }
}
