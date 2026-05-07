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
  ssh_public_key      = var.ssh_public_key
  tags                = var.tags
}
