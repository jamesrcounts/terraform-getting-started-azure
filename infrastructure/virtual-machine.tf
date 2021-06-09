# Create a Linux virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  admin_password                  = random_password.admin_password.result
  admin_username                  = "plankton"
  disable_password_authentication = false
  location                        = data.azurerm_resource_group.rg.location
  name                            = "vm-${local.instance_id}"
  resource_group_name             = data.azurerm_resource_group.rg.name
  size                            = "Standard_DS1_v2"
  tags                            = data.azurerm_resource_group.rg.tags

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    caching              = "ReadWrite"
    disk_size_gb         = 1024
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

resource "random_password" "admin_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}