terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}  
}

data "azurerm_resource_group" "existingrg" {
  name = "NextOpsRGT07"
}

locals {
  rg_name = data.azurerm_resource_group.existingrg.name
  rg_location = data.azurerm_resource_group.existingrg.location
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "${var.prefix}-20"
  resource_group_name = "${local.rg_name}"    //local.
  location            = "${local.rg_location}" //local.
  address_space       = ["${var.vnet_cidr_prefix}"]
}

output "rgname" {
    value = "${local.rg_name}"
}