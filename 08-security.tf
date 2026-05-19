#network security group for web subnet
resource "azurerm_network_security_group" "web_subnet_nsg" {
  name                = "${azurerm_subnet.web_subnet.name}-NSG"
  location            = azurerm_resource_group.myresource.location
  resource_group_name = azurerm_resource_group.myresource.name
}
resource "azurerm_network_security_rule" "web_security_rules" {
    for_each = local.web_subnet_inbound_ports_map
  name                        = "Rule-Port_${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.myresource.name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
}
resource "azurerm_subnet_network_security_group_association" "web_subnet_nsg_association" {
    depends_on = [ azurerm_network_security_rule.web_security_rules ]
  subnet_id                 = azurerm_subnet.web_subnet.id
  network_security_group_id = azurerm_network_security_group.web_subnet_nsg.id
}
#network security group for virtual maching network interface card
resource "azurerm_network_security_group" "web_vmnic_nsg" {
  name                = "${azurerm_network_interface.web_linuxvm_nic.name}-NSG"
  location            = azurerm_resource_group.myresource.location
  resource_group_name = azurerm_resource_group.myresource.name
}
resource "azurerm_network_security_rule" "web_vmnic_nsg_inbound_rule" {
    for_each = local.web_vmnic_inbound_ports_map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.myresource.name
  network_security_group_name = azurerm_network_security_group.web_vmnic_nsg.name
}


resource "azurerm_network_interface_security_group_association" "web_vmnic_nsg_association" {
  network_interface_id      = azurerm_network_interface.web_linuxvm_nic.id
  network_security_group_id = azurerm_network_security_group.web_vmnic_nsg.id
}

