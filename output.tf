output "vm_private_ip" {
  description = "Private IP address of the virtual machine"
  value       = module.virtual-machine.network_interface_private_ip
}

output "vm_public_ip_address" {
  description = "The assigned IP address of the public IP"
  value       = module.avm-res-network-publicipaddress.public_ip_address
}



