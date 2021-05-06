# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.rg.location
  name                = "vnet-${local.instance_id}"
  resource_group_name = data.azurerm_resource_group.rg.name
  tags                = data.azurerm_resource_group.rg.tags
}

# Create subnet
resource "azurerm_subnet" "subnet" {
  # address_prefixes     = ["10.0.1.0/24"]
  address_prefixes     = ["10.0.1.0/24"]
  name                 = "virtual-machines"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}
