# Create network interface
resource "azurerm_network_interface" "nic" {
  name                = "nic-${local.instance_id}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tags                = data.azurerm_resource_group.rg.tags

  ip_configuration {
    name                          = "primary"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(azurerm_subnet.subnet.address_prefixes.0, 4)
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}

# Create public IP
resource "azurerm_public_ip" "publicip" {
  name                = "pip-${local.instance_id}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = "Static"
  tags                = data.azurerm_resource_group.rg.tags
  public_ip_prefix_id = azurerm_public_ip_prefix.pib.id
  sku                 = "Standard"
}

resource "azurerm_public_ip_prefix" "pib" {
  name                = "pib-${local.instance_id}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  prefix_length       = 31
  tags                = data.azurerm_resource_group.rg.tags
}