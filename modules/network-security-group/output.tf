output "nsg_id" {
  description = "The ID of the Network Security Group"
  value       = azurerm_network_security_group.my_terraform_nsg.id
}
