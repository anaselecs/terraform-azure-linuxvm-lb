
resource "azurerm_lb" "web_lb" {
  name                = "${local.resource_name_prefix}-web-lb"
 resource_group_name = azurerm_resource_group.myresource.name
  location            = azurerm_resource_group.myresource.location

  frontend_ip_configuration {
    name                 = "Web-lb-ip-1"
    public_ip_address_id = azurerm_public_ip.web_lbpuplicip.id
  }
}
resource "azurerm_lb_backend_address_pool" "web_lb_backendpool" {
  loadbalancer_id = azurerm_lb.web_lb.id
  name            = "${azurerm_lb.web_lb.name}-backend-pool"
}

resource "azurerm_lb_probe" "web_lb_probe" {
  loadbalancer_id = azurerm_lb.web_lb.id
  name            = "tcp-running-probe"
  port            = 80
}
resource "azurerm_lb_rule" "web_lb_rule_app1" {
  loadbalancer_id                = azurerm_lb.web_lb.id
  name                           = "web-app1-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.web_lb_backendpool.id]
  probe_id = azurerm_lb_probe.web_lb_probe.id
}
resource "azurerm_network_interface_backend_address_pool_association" "web_nic_lb_associate" {
  network_interface_id    = azurerm_network_interface.web_linuxvm_nic.id
  ip_configuration_name   = azurerm_network_interface.web_linuxvm_nic.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.web_lb_backendpool.id
}
resource "azurerm_lb_nat_rule" "web_lb_inbound_nat_rule_22" {
resource_group_name = azurerm_resource_group.myresource.name
  loadbalancer_id                = azurerm_lb.web_lb.id
  name                           = "SSH-1022-VM-22"
  protocol                       = "Tcp"
  frontend_port                  = 1022
  backend_port                   = 22
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
}


resource "azurerm_network_interface_nat_rule_association" "assocaite_inbound" {
  network_interface_id  = azurerm_network_interface.web_linuxvm_nic.id
  ip_configuration_name = azurerm_network_interface.web_linuxvm_nic.ip_configuration[0].name
  nat_rule_id           = azurerm_lb_nat_rule.web_lb_inbound_nat_rule_22.id
}
#whatever
