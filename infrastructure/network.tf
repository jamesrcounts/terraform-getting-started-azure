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
  address_prefixes     = [cidrsubnet(azurerm_virtual_network.vnet.address_space.0, 8, 1)]
  name                 = "virtual-machines"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-${local.instance_id}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tags                = data.azurerm_resource_group.rg.tags
}


resource "azurerm_subnet_network_security_group_association" "nsg_to_subnet" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
