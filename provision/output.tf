output "machines" {
  description = "Name and ID of the virtual machines"
  value       = { for name, vm in proxmox_virtual_environment_vm.machine : name => vm.vm_id }
}

output "access_password" {
  description = "Generated password: user user on the machines"
  value       = random_password.root.result
  sensitive   = true
}

