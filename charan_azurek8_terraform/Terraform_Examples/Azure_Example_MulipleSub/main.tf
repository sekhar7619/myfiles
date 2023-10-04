# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "a355c32e-4a22-4b05-aab4-be236850fa6e"
  features {}
}

provider "azurerm" {
  alias  = "new"
  subscription_id = "f6cc4f78-bbd8-4a50-a071-508a71818c40"
  features {}
}


#create resource group
resource "azurerm_resource_group" "rg" {
    name     = "${var.rgname}"
    location = "${var.location}"
    tags      = {
        Environment = "Terraform Demo"
    }
}

resource "azurerm_resource_group" "rg_new" {
    provider = azurerm.new
    name     = "New_Sub_RG"
    location = "EastUS"
}

