resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create a Linux virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  admin_username                  = "plankton"
  disable_password_authentication = true
  location                        = data.azurerm_resource_group.rg.location
  name                            = "vm-${local.instance_id}"
  resource_group_name             = data.azurerm_resource_group.rg.name
  size                            = "Standard_DS1_v2"
  tags                            = data.azurerm_resource_group.rg.tags

  admin_ssh_key {
    username   = "adminuser"
    public_key = tls_private_key.key.public_key_openssh
  }

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    caching              = "ReadWrite"
    disk_size_gb         = 512
    storage_account_type = "Premium_LRS"
    name                 = "vm-${local.instance_id}-os"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
