resource "azurerm_linux_virtual_machine" "web_linuxvm" {
  name                = "${local.resource_name_prefix}-web-linuxvm"
  resource_group_name = azurerm_resource_group.myresource.name
  location            = azurerm_resource_group.myresource.location
  size                = var.vm_size
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.web_linuxvm_nic.id
  ]

 admin_ssh_key {
    username   = var.admin_username
    public_key = file("${path.module}/public-key/public-key.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "9-lvm"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/app-scripts/redhat-webvm-script.sh")
}
