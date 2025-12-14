# Roadmap

## Version 0.1.x (Current)

### Completed in 0.1.1
- ✅ Self-healing system for VNet status management
- ✅ Systemd-based automated status correction
- ✅ Improved documentation and examples

### Planned for 0.1.x
- Enhanced error handling and validation around SDN IDs
- Additional example configurations
- Improved DHCP configuration validation

## Version 0.2.0

- Multi-node cluster support (single shared SDN zone across nodes)
- Improved Proxmox API error handling
- Optional SDN controller integration
- Enhanced validation for zone and VNet naming

## Version 0.3.0

- Multiple SDN zones per deployment
- BGP/EVPN zone support
- Advanced DHCP options (reservations, custom options)
- Terraform Cloud/Enterprise compatibility testing
- NetBox integration example

## Version 1.0.0

- Stable API
- Complete multi-node production support
- Comprehensive test suite
- Production-ready hardening
- Full CI/CD pipeline

## Future Considerations

- IPv6 support
- Dynamic DNS integration (beyond dnsmasq)
- Network observability hooks (Prometheus/Grafana integration)
- Automated backup/restore for SDN configuration
- Integration with external IPAM systems
