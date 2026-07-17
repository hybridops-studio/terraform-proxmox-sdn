Title:

```text
Add API-only edge-routed mode
```

Body:

```markdown
## Summary

Picked this up from #31.

This adds a fresh edge-routed path for environments where gateway, DHCP, firewall policy, and upstream routing are handled outside Proxmox.

In that mode, Proxmox SDN objects can be managed without requiring host login. The existing host-managed path stays as the default, so current users should not see behaviour change unless they set `enable_host_orchestration = false`.

Also added:

- a new `examples/api-only-edge-routed` example
- README notes for when this mode should be used
- tests covering the default host-managed path and the API-only path

## Validation

- `terraform fmt -check -recursive`
- `terraform validate -no-color`
- `terraform test -no-color`
- `terraform -chdir=examples/api-only-edge-routed validate -no-color`
- `terraform -chdir=examples/basic validate -no-color`
- `terraform -chdir=examples/multi-node validate -no-color`
- `terraform -chdir=examples/no-dhcp validate -no-color`
- `terraform -chdir=examples/homelab-six-vlans validate -no-color`

Closes #31
```
