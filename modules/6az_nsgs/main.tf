resource "azurerm_network_security_group" "nsg_block" {
  for_each            = var.nsgs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "security_rule" {
    for_each = var.security_rule
    content {
      name              = security_rule.value.name
      priority          = security_rule.value.priority
      direction         = security_rule.value.direction
      access            = security_rule.value.access
      protocol          = security_rule.value.protocol
      source_port_range = security_rule.value.source_port_range

    }
  }
}

