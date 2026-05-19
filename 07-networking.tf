# virtual network
resource "azurerm_virtual_network" "myvnet" {
  name                = "${local.resource_name_prefix}-${var.Vnet_name}"
  address_space       =  var.Vnet_address_space
  location            = azurerm_resource_group.myresource.location
  resource_group_name = azurerm_resource_group.myresource.name
}
#virtual subnet
resource "azurerm_subnet" "web_subnet" {
  name                 = "${azurerm_virtual_network.myvnet.name}-${var.web_subnet_name}"
  resource_group_name  = azurerm_resource_group.myresource.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = var.web_subnet_address_prefixes
}
#loadbalancer public ip address
resource "azurerm_public_ip" "web_lbpuplicip" {
  name                = "${local.resource_name_prefix}-lb-publicip"
  resource_group_name = azurerm_resource_group.myresource.name
  location            = azurerm_resource_group.myresource.location
  allocation_method   = "Static"
}
#network interface for linux vm

resource "azurerm_network_interface" "web_linuxvm_nic" {
  name                = "${local.resource_name_prefix}-web-linuxvm-nic"
  location            = azurerm_resource_group.myresource.location
  resource_group_name = azurerm_resource_group.myresource.name

  ip_configuration {
    name                          = "web-linuxvm-ip-1"
    subnet_id                     = azurerm_subnet.web_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
