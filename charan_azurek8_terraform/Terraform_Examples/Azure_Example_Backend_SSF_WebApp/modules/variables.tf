variable "rgname"{
    type = string
    description = "used for naming resource group"
}

variable "location"{
    type = string
    description = "used for selecting location"
    default = "eastus"
}

variable "webappname" {
  type = string
  description = "The webappname used for all resources in this example"
}

variable "mysqlname" {
  type = string
  description = "The mysqlname used for all resources in this example"
}

variable "aspname" {
  type = string
  description = "The aspname used for all resources in this example"
}

