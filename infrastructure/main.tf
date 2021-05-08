# Common variables shared by multiple resources
locals {
  instance_id = data.azurerm_resource_group.rg.tags["instance_id"]
}
