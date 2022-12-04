<!-- BEGIN_TF_DOCS -->
# Terraform: Getting Started with Azure

Deploys a simple VM as a basic example of working with Azure in Terraform.

## Required Inputs

The following input variables are required:

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group for this project.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_client_id"></a> [client\_id](#input\_client\_id)

Description: The AzureAD Appication Client ID

Type: `string`

Default: `null`

### <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret)

Description: The AzureAD Application Password

Type: `string`

Default: `null`

### <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id)

Description: The Azure subscription ID

Type: `string`

Default: `null`

### <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id)

Description: The Azure AD tenant ID

Type: `string`

Default: `null`

## Outputs

No outputs.

## Resources

The following resources are used by this module:

- [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) (resource)
- [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) (resource)
- [azurerm_network_interface.nic2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) (resource)
- [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) (resource)
- [azurerm_public_ip.publicip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) (resource)
- [azurerm_public_ip_prefix.pib](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip_prefix) (resource)
- [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) (resource)
- [azurerm_subnet_network_security_group_association.nsg_to_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) (resource)
- [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) (resource)
- [tls_private_key.key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) (resource)
- [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.3.6)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 2)

- <a name="requirement_random"></a> [random](#requirement\_random) (~> 3)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (2.99.0)

- <a name="provider_tls"></a> [tls](#provider\_tls) (4.0.4)

## Modules

No modules.

## Update Docs

Run this command:

```
terraform-docs markdown document --output-file README.md --output-mode inject .
```
<!-- END_TF_DOCS -->