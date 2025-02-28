module "virtual-machine" {
  source  = "Azure/virtual-machine/azurerm"
  version = "2.0.0"
  # insert the 7 required variables here
  location            = local.location
  image_os            = "linux"
  name                = "my-vm"
  resource_group_name = local.resource_group_name
  size                = "Standard_DS1_v2"
  admin_username = "adminuser"
  admin_password = "Password1234!"
  disable_password_authentication = false




  # insert the 2 optional variables here
  # data_disks = []
  os_disk = {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    storage_account_type = "Standard_LRS"
  }
  subnet_id = module.vnet.vnet_subnets[0]





   source_image_reference = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  
  #   data_disks = [
  #     for i in range(2) : {
  #       name                 = "linuxdisk${random_id.id.hex}${i}"
  #       storage_account_type = "Standard_LRS"
  #       create_option        = "Empty"
  #       disk_size_gb         = 1
  #       attach_setting = {
  #         lun     = i
  #         caching = "ReadWrite"
  #       }
  #       disk_encryption_set_id = azurerm_disk_encryption_set.example.id
  #     }
  #   ]

 }




