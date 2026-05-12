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
  dns_service_ip      = var.aks_dns_service_ip
  service_cidr        = var.aks_service_cidr
  pod_cidr            = var.aks_pod_cidr
  load_balancer_sku   = var.aks_load_balancer_sku
}

module "mysql" {
  source                 = "./modules/mysql"
  server_name            = var.mysql_server_name
  location               = module.resource_group.location
  resource_group_name    = module.resource_group.name
  administrator_login    = var.mysql_administrator_login
  administrator_password = var.mysql_administrator_password
  sku_name               = var.mysql_sku_name
  tags                   = var.tags
}

module "cosmosdb" {
  source              = "./modules/cosmosdb"
  account_name        = var.cosmosdb_account_name
  location            = var.cosmosdb_location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

module "keyvault" {
  source              = "./modules/keyvault"
  vault_name          = var.keyvault_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  tenant_id           = var.keyvault_tenant_id
  tags                = var.tags
}

resource "helm_release" "ingress_nginx" {
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true

  depends_on = [module.aks]
}

resource "azurerm_role_assignment" "kubelet_kv_secrets_user" {
  scope                = module.keyvault.vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = module.aks.kubelet_identity
}

import {
  to = module.mysql.azurerm_mysql_flexible_server.this
  id = "/subscriptions/fc6b3998-07f2-49a2-b89b-c185f48448c3/resourceGroups/soqoni-rg/providers/Microsoft.DBforMySQL/flexibleServers/soqoni-mysql"
}

import {
  to = module.cosmosdb.azurerm_cosmosdb_account.this
  id = "/subscriptions/fc6b3998-07f2-49a2-b89b-c185f48448c3/resourceGroups/soqoni-rg/providers/Microsoft.DocumentDB/databaseAccounts/soqoni-cosmos"
}

import {
  to = module.keyvault.azurerm_key_vault.this
  id = "/subscriptions/fc6b3998-07f2-49a2-b89b-c185f48448c3/resourceGroups/soqoni-rg/providers/Microsoft.KeyVault/vaults/soqoni-kv"
}
