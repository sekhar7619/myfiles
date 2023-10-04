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
  // tfuser2
  subscription_id = "a355c32e-4a22-4b05-aab4-be236850fa6e"
  client_id       = "17be1922-9505-4e5a-a0ff-4271ff1bb4b0"
  client_secret   = "~6.KUte823.AvsW~SI_nf2LWqv1dJ4k_7i"
  tenant_id       = "9085ff8c-8807-4ff8-a403-ea470525cda6"
}

#Resource Group Definition
resource "azurerm_resource_group" "rg1" {
  name     = var.rgname
  location = var.location
}



