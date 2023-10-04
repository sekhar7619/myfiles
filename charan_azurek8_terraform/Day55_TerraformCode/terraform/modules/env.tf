variable "rgname" {}
variable "location" {}
variable "aspname" {}
variable "mysqlname" {}
variable "webappname" {}


#create resource group
resource "azurerm_resource_group" "rg" {
    name     = var.rgname
    location = var.location
    tags      = {
        Environment = "Terraform Demo"
    }
}

resource "azurerm_app_service_plan" "appserviceplan" {
  name                = var.aspname
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}


resource "azurerm_mysql_server" "mysql" {
  name                = var.mysqlname
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  administrator_login          = "mysqladmin"
  administrator_login_password = "P2ssw0rd@123"

  sku_name   = "GP_Gen5_2"
  storage_mb = 10240
  version    = "8.0"
  ssl_enforcement_enabled = true

  
}

resource "azurerm_app_service" "webapp" {
  name                = var.webappname
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id 


  connection_string {
    name  = "MyshuttleDb"
    type  = "MySql"
    value = "jdbc:mysql://${var.mysqlname}.mysql.database.azure.com:3306/nextopsmysqldb?useSSL=true&requireSSL=false&autoReconnect=true&user=mysqladmin&password=P2ssw0rd@123"
  }


  } 

