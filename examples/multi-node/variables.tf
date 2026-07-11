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

variable "proxmox_nodes" {
  description = "Proxmox node names that should share the SDN zone"
  type        = list(string)
}

variable "proxmox_host" {
  description = "One Proxmox cluster node used for SSH-based SDN apply and status operations"
  type        = string
}
