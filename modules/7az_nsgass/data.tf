data "azurerm_subnet" "subnet_datablock" {
  for_each             = var.nsgass
  name                 = each.value.subnetname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_network_security_group" "nsg_datablock" {
  for_each            = var.nsgass
  name                = each.value.nsgname
  resource_group_name = each.value.resource_group_name
}
