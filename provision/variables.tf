variable "proxmox_api_token" {
  description = "Proxmox API token in user@realm!token-name=secret format"
  type        = string
  sensitive   = true
}

variable "proxmox_node" {
  description = "proxmox node name"
  type        = string
  sensitive   = false
}

variable "proxmox_endpoint" {
  description = "proxmox node IP:Port"
  type        = string
  sensitive   = false
}

variable "proxmox_node_address" {
  description = "proxmox node IP"
  type        = string
  sensitive   = false
}

variable "proxmox_insecure" {
  description = "necessity of proxmox HTTPS connection"
  type        = bool
  sensitive   = false
}

variable "proxmox_ssh_username" {
  description = "username for ssh connection"
  type        = string
  sensitive   = false
}
