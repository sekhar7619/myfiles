terraform {
  backend "azurerm" {
    storage_account_name = ""
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    sas_token = ""
  }
}