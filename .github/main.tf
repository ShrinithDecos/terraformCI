terraform {
  required_version = ">= 1.3.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.43.0"
    }
  }
  cloud {    
    organization = "shrinithdecos" 
    workspaces { 
      name = "tf-shrinith-ws" 
    } 
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "aks-rg-shri"
  location = "Central India"
}

resource "azurerm_storage_account" "storage" {
  name                     = "aksstorageaccountshri2"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}