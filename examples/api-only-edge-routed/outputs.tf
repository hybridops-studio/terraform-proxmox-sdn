# file: examples/api-only-edge-routed/outputs.tf
# purpose: Expose SDN outputs for the API-only edge-routed example

output "zone_name" {
  description = "SDN zone name."
  value       = module.sdn.zone_name
}

output "vnets" {
  description = "Created SDN VNets."
  value       = module.sdn.vnets
}

output "subnets" {
  description = "Created SDN subnets."
  value       = module.sdn.subnets
}
