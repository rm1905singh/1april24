data "azurerm_network_interface" "nics_datablock" {
  for_each            = var.vms
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}
