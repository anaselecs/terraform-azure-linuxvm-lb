output "virtual_network_name" {
  value = azurerm_virtual_network.myvnet.name
}
output "web_subnte_id" {
  value = azurerm_subnet.web_subnet.id
}
output "web_linuxvm_name" {
  value = azurerm_linux_virtual_machine.web_linuxvm.name
}
output "puplic_ip_address" {
  value = azurerm_public_ip.web_lbpuplicip.name
}
output "resource_group_name" {
  value = azurerm_resource_group.myresource.name
}