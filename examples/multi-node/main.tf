terraform {
  required_version = ">= 1.5.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.50.0"
    }
  }
}

provider "proxmox" {
  endpoint  = var.proxmox_url
  api_token = var.proxmox_token
  insecure  = var.proxmox_insecure
}

# Current module version: single-node SDN zone.
# This example uses a "cluster-zone" VNet design on node1.
module "sdn_node1" {
  source = "../.."

  # SDN zone ID must be <= 8 chars, no dashes
  zone_name    = "clust01"
  proxmox_node = var.proxmox_node1
  proxmox_host = var.proxmox_host_node1

  vnets = {
    vclst01m = { # <= 8 chars, valid SDN ID
      vlan_id     = 200
      description = "Cluster MGMT Network - Node 1"
      subnets = {
        cluster = {
          cidr             = "10.200.0.0/24"
          gateway          = "10.200.0.1"
          dhcp_enabled     = true
          dhcp_range_start = "10.200.0.100"
          dhcp_range_end   = "10.200.0.150"
          dhcp_dns_server  = "8.8.8.8"
        }
      }
    }
  }

  proxmox_url      = var.proxmox_url
  proxmox_token    = var.proxmox_token
  proxmox_insecure = var.proxmox_insecure
}
output "zone_name_node1" {
  description = "SDN zone name (node1)"
  value       = module.sdn_node1.zone_name
}

output "vnets_node1" {
  description = "Created VNets (node1)"
  value       = module.sdn_node1.vnets
}

output "subnets_node1" {
  description = "Created subnets with DHCP configuration (node1)"
  value       = module.sdn_node1.subnets
}

# Planned future usage once the module supports a node list:
#
# module "sdn_node2" {
#   source = "../.."
#
#   # SDN zone ID must be <= 8 chars, no dashes
#   zone_name    = "clust01"
#   proxmox_node = var.proxmox_node2
#   proxmox_host = var.proxmox_host_node2
#
#   vnets = {
#     vclst02m = {  # <= 8 chars, valid VNet ID
#       vlan_id     = 200
#       description = "Cluster MGMT Network - Node 2"
#       subnets = {
#         cluster = {
#           cidr             = "10.200.0.0/24"
#           gateway          = "10.200.0.1"
#           dhcp_enabled     = true
#           dhcp_range_start = "10.200.0.151"
#           dhcp_range_end   = "10.200.0.200"
#           dhcp_dns_server  = "8.8.8.8"
#         }
#       }
#     }
#   }
#
#   proxmox_url      = var.proxmox_url
#   proxmox_token    = var.proxmox_token
#   proxmox_insecure = var.proxmox_insecure
# }

# output "zone_name_node2" {
#   description = "SDN zone name (node2)"
#   value       = module.sdn_node2.zone_name
# }

# output "vnets_node2" {
#   description = "Created VNets (node2)"
#   value       = module.sdn_node2.vnets
# }

# output "subnets_node2" {
#   description = "Created subnets with DHCP configuration (node2)"
#   value       = module.sdn_node2.subnets
# }
