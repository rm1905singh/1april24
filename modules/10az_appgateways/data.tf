data "azurerm_subnet" "subnet_datablock" {
  for_each             = var.app_gateway
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "pip_datablock" {
  for_each            = var.app_gateway
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}
