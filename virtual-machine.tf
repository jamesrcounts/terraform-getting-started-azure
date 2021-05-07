# Create a Linux virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "vm-${local.instance_id}"
  resource_group_name             = data.azurerm_resource_group.rg.name
  location                        = data.azurerm_resource_group.rg.location
  size                            = "Standard_DS1_v2"
  admin_username                  = "plankton"
  admin_password                  = "Password1234!"
  disable_password_authentication = false
  tags                            = data.azurerm_resource_group.rg.tags

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    caching              = "ReadWrite"
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