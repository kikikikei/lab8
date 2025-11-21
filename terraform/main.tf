terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "9439de3e-76a3-4acf-a49b-199192251b27"
}

resource "azurerm_resource_group" "example" {
  name     = "K21-ResourceGroup"
  location = "East US"
}

resource "azurerm_virtual_network" "example" {
  name                = "K21-VNET"
  address_space       = ["10.0.0.0/16"]  
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "K21-Subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"] 
}
