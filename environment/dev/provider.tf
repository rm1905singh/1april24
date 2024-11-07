terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.97.1"
    }
  }

}

provider "azurerm" {
  features {

  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "BU1_rgs"
    storage_account_name = "BU1_sa"
    container_name       = "BU1_ca"
    key                  = "BU1devtf.tfstate"
  }
}
