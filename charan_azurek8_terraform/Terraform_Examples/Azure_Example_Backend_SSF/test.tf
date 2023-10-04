module "vnet_module_test" {
    source = "./modules"
    prefix = "test"
    vnet_cidr_prefix = "10.30.0.0/16"
    subnet1_cidr_prefix = "10.30.1.0/24"
    rgname = "ModuleTestRG"
    location = "CentralUS"   
}