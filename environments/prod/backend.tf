terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tf-backend"
    storage_account_name = "tfterraformstate01"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
