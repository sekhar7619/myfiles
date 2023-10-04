terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

module "vnet_module_dev" {
    source = "./modules"
    webappname = var.webappname
    aspname = var.aspname
    mysqlname = var.mysqlname
    rgname = var.rgname
    location = var.location   
}