# Examples

Each directory under `examples/` demonstrates a specific use case for the `terraform-proxmox-sdn` module.

Each example directory also includes its own `README.md` so the Terraform Registry can render the example page with the correct purpose and usage notes.

## Available examples

| Example | Description |
|---|---|
| `basic` | Single VNet with DHCP (minimal configuration). |
| `api-only-edge-routed` | Fresh edge-routed SDN zone without Proxmox host login. |
| `homelab-six-vlans` | Six VLAN reference layout for segmented environments. |
| `no-dhcp` | Static IP networking without DHCP. |
| `multi-node` | Shared edge-routed SDN zone across several Proxmox cluster nodes. |

## Run an example

From the repository root:

1. Change into the example directory:

   ```bash
   cd examples/basic
   ```

2. Create a working tfvars file:

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

3. Edit `terraform.tfvars` to match your environment.

4. Apply:

   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Required variables

All examples expect the following variables:

```hcl
proxmox_url      = "https://PROXMOX-IP:8006/api2/json"
proxmox_token    = "USER@REALM!tokenid=TOKEN_SECRET"
proxmox_insecure = true
proxmox_node     = "pve"
proxmox_host     = "PROXMOX-IP"
```

`api-only-edge-routed` intentionally omits `proxmox_host` because host login is
disabled for that fresh edge-routed path.

Notes:

- Set `proxmox_insecure = false` when your Proxmox API endpoint has a valid TLS certificate.
- Create an API token in the Proxmox UI under **Datacenter → Permissions → API Tokens**.
- The module and examples expect a single `proxmox_token` string in the format:
  - `<user>@<realm>!<tokenid>=<token_secret>`

## Example tfvars

Example: `examples/basic/terraform.tfvars.example`

```hcl
proxmox_url      = "https://192.168.1.10:8006/api2/json"
proxmox_token    = "root@pam!terraform=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
proxmox_insecure = true

proxmox_node = "pve"
proxmox_host = "192.168.1.10"
```

You can use this as a starting point and adjust IPs, node names, and credentials to match your environment.
