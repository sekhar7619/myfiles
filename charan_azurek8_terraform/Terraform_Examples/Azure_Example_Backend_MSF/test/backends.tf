terraform {
  backend "azurerm" {
    storage_account_name = "nextopstfsat07"
    container_name       = "tfstate"
    key                  = "test/terraform.tfstate"
    sas_token = "?sv=2020-02-10&ss=b&srt=sco&sp=rwdlactfx&se=2021-06-08T21:00:02Z&st=2021-06-08T13:00:02Z&spr=https&sig=G%2Fm%2F2dyraQcxdAL7c%2FOEcWRQtCCGDRxcMq%2BCkShJiHA%3D"
  }
}