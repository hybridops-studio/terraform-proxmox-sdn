variable "proxmox_url" {
  description = "Proxmox API URL (e.g., https://192.168.1.10:8006/api2/json)"
  type        = string
}

variable "proxmox_token" {
  description = "Proxmox API token (USER@REALM!TOKENID=UUID)"
  type        = string
  sensitive   = true
}

variable "proxmox_insecure" {
  description = "Skip TLS verification"
  type        = bool
  default     = true
}

variable "proxmox_node1" {
  description = "Primary Proxmox node name (e.g., pve or hybridhub)"
  type        = string
}

variable "proxmox_host_node1" {
  description = "Primary Proxmox node IP for SSH"
  type        = string
}

variable "proxmox_node2" {
  description = "Secondary Proxmox node name (planned / optional)"
  type        = string
  default     = ""
}

variable "proxmox_host_node2" {
  description = "Secondary Proxmox node IP for SSH (planned / optional)"
  type        = string
  default     = ""
}
