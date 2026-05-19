locals {
  resource_name_prefix = "${var.environment}-${var.project_name}-${var.location_short}"
  common_tags = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
  }
  web_subnet_inbound_ports_map = {
    "100" : "80",
    "110" : "443",
    "120" : "22"
  }
  web_vmnic_inbound_ports_map = {
    "100" : "80",
    "110" : "443",
    "120"  : "22"
  }


}