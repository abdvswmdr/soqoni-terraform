import {
  to = module.resource_group.azurerm_resource_group.this
  id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}"
}

import {
  to = module.aks.azurerm_kubernetes_cluster.this
  id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${var.aks_cluster_name}"
}

module "resource_group" {
  source   = "./modules/resource-group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "aks" {
  source              = "./modules/aks"
  cluster_name        = var.aks_cluster_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  dns_prefix          = var.aks_dns_prefix
  kubernetes_version  = var.kubernetes_version
  node_count          = var.node_count
  vm_size             = var.vm_size
  tags                = var.tags
}
