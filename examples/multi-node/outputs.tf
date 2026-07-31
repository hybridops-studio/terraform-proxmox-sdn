# file: outputs.tf
# purpose: Expose SDN outputs for the shared cluster zone

output "sdn_cluster" {
  description = "SDN objects shared by the configured Proxmox cluster nodes."
  value = {
    zone_name = module.sdn_cluster.zone_name
    vnets     = module.sdn_cluster.vnets
    subnets   = module.sdn_cluster.subnets
  }
}
