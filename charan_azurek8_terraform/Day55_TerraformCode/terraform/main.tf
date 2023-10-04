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

terraform {
  backend "azurerm" {
    resource_group_name   = #{ResourceGroupName}#
    storage_account_name  = #{terraformstorageaccount}#
    container_name        = "terraform"
    key                   = "terraform.tfstate"
  }
}

variable "rgname" {}
variable "location" {}
variable "aspname" {}
variable "mysqlname" {}
variable "webappname" {}

module "web_mysql_asp" {
    source = "./modules"
    webappname = var.webappname
    aspname = var.aspname
    mysqlname = var.mysqlname
    rgname = var.rgname
    location = var.location   
}