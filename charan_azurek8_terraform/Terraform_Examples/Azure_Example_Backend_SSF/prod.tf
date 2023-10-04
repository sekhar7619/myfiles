module "vnet_module_prod" {
    source = "./modules"
    prefix = "prod"
    vnet_cidr_prefix = "10.20.0.0/16"
    subnet1_cidr_prefix = "10.20.1.0/24"
    rgname = "ModuleProdRG"
    location = "EastUS"   
}