variable "proxmox_url" {
  description = "Proxmox API URL."
  type        = string
}

variable "proxmox_token" {
  description = "Proxmox API token."
  type        = string
  sensitive   = true
}

variable "proxmox_insecure" {
  description = "Skip TLS verification."
  type        = bool
  default     = true
}

variable "proxmox_node" {
  description = "Proxmox node name for SDN zone membership."
  type        = string
}
