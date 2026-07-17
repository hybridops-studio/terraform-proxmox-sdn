# API-Only Edge-Routed Example

Create a Proxmox SDN zone, VNets, and subnets for a fresh edge-routed deployment
without logging in to the Proxmox host.

Use this when routing, gateways, DHCP, firewall policy, and upstream connectivity
are owned by a separate network layer.

## What it creates

- SDN zone `apionly` on bridge `vmbr0`.
- VNet `vapimgmt` using VLAN ID `210`.
- Subnet `10.210.0.0/24` with gateway metadata `10.210.0.1`.

The gateway value is kept as SDN subnet metadata. This example does not configure
host gateway addresses, SNAT, DHCP, static routes, or host recovery.

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init -backend=false
terraform validate
terraform plan
terraform apply
```

Edit `terraform.tfvars` before running `terraform plan`.

## Required variables

- `proxmox_url`
- `proxmox_token`
- `proxmox_node`

`proxmox_host` is intentionally not required because host login is disabled.
