terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstatedevinitcron"
    container_name       = "tfstate"
    key                  = "soqoni/soqoni.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
