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

#Resource Group Definition
resource "azurerm_resource_group" "rg1" {
  name     = var.rgname
  location = "centralus"
}



