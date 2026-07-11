# Multi-Node Example

Assign one Proxmox SDN zone and its VNets to several cluster nodes while routing
and DHCP remain in a separate edge or network-services layer.

## What it creates

- SDN zone `clust01` on bridge `vmbr0` across the names in `proxmox_nodes`.
- VNet `vclst01m` using VLAN ID `200`.
- Subnet `10.200.0.0/24` with the edge-owned gateway `10.200.0.1`.

The module does not configure host L3, SNAT, DHCP, or static routes in this
example. Those features still target one `proxmox_host` and are not supported
with a multi-node membership list.

`proxmox_host` selects one reachable cluster node for SSH-based SDN apply and
status operations. It does not make that node the gateway.

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init -backend=false
terraform validate
terraform plan
terraform apply
```

Edit `terraform.tfvars` before running `terraform plan`.

## Required Variables

- `proxmox_url`
- `proxmox_token`
- `proxmox_nodes`
- `proxmox_host`

## Outputs

- `sdn_cluster`: Zone, VNet, and subnet values for the shared cluster SDN.
