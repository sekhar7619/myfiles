variable "rgname"{
    type = string
    description = "used for naming resource group"
}

variable "location"{
    type = string
    description = "used for selecting location"
    default = "eastus"
}

variable "prefix" {
  type = string
  description = "The prefix used for all resources in this example"
}

variable "vnet_cidr_prefix" {
  type = string
  description = "This variable defines address space for vnet"
}

variable "subnet1_cidr_prefix" {
  type = string
  description = "This variable defines address space for subnetnet"
}

variable "vms" {
    type = map(string)
    default = {
      vm1 = "Standard_B1s"
      vm2 = "Standard_B2s"
    }
    description = "Name of the VM"
}