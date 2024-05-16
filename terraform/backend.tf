terraform {
  backend "azurerm" {
    resource_group_name   = "GoogleMapsAPIKey"
    storage_account_name  = "googlemapsapikey"
    container_name        = "terraformstate"
    key                   = "terraform.tfstate"
  }
}
