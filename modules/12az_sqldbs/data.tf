data "azurerm_mssql_server" "server_datablock" {
  for_each            = var.sqldbs
  name                = each.value.svr_name
  resource_group_name = each.value.resource_group_name
}
