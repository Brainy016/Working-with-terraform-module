resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = local.location
}


module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "5.0.1"
  # insert the 2 required variables here
  resource_group_name = local.resource_group_name
  vnet_location       = local.location
}

module "network-security-group" {
  source              = "./modules/network-security-group"
  nsg_name            = "my-nsg"
  location            = local.location
  resource_group_name = local.resource_group_name
}

# module "caf-public-ip" {
#   source  = "aztfmod/caf-public-ip/azurerm"
#   version = "2.1.0"
#   # insert the 9 required variables here
#   convention            = "random"

# }

module "avm-res-network-publicipaddress" {
  source  = "Azure/avm-res-network-publicipaddress/azurerm"
  version = "0.2.0"
  # insert the 3 required variables here
  location            = local.location
  resource_group_name = local.resource_group_name
  name      = "my-public-ip"
  allocation_method   = "Dynamic"
}




