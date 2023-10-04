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

resource "azurerm_virtual_network" "vnet1" {
  name                = "${var.prefix}-20"
  resource_group_name = "${data.azurerm_resource_group.existingrg.name}"    //data.
  location            = "${data.azurerm_resource_group.existingrg.location}" //data.
  address_space       = ["${var.vnet_cidr_prefix}"]
}


