resource "azurerm_resource_group" "myresource" {
name = "${local.resource_name_prefix}-${var.resource_group_name}-001"
location = var.resource_group_location
}