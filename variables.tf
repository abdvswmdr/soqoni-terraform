variable "subscription_id" {
  type        = string
  description = "Azure subscription ID — set via TF_VAR_subscription_id or terraform.tfvars (gitignored)"
}

variable "location" {
  type        = string
  description = "Azure region for all resources"
  default     = "eastasia"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "soqoni-rg"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources"
  default = {
    project    = "soqoni"
    managed_by = "terraform"
  }
}

variable "aks_cluster_name" {
  type        = string
  description = "AKS cluster name"
  default     = "soqoni-aks"
}

variable "aks_dns_prefix" {
  type        = string
  description = "DNS prefix for the AKS cluster (must match existing cluster on import)"
  default     = "soqoni-aks-soqoni-rg-fc6b39"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version for AKS"
  default     = "1.34"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the default node pool"
  default     = 1
}

variable "vm_size" {
  type        = string
  description = "VM size for the default node pool"
  default     = "Standard_B2s"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for AKS Linux node pool — matches key used at cluster creation"
}

variable "mysql_server_name" {
  type    = string
  default = "soqoni-mysql"
}

variable "mysql_administrator_login" {
  type    = string
  default = "catalogueadmin"
}

variable "mysql_administrator_password" {
  type        = string
  sensitive   = true
  description = "MySQL admin password — must pass provider complexity validation but is never applied (lifecycle ignore_changes)"
}

variable "cosmosdb_account_name" {
  type    = string
  default = "soqoni-cosmos"
}

variable "cosmosdb_location" {
  type        = string
  description = "Region for Cosmos DB — separate from main location (Malaysia West for lower latency to SEA)"
  default     = "malaysiawest"
}

variable "keyvault_name" {
  type    = string
  default = "soqoni-kv"
}

variable "keyvault_tenant_id" {
  type        = string
  description = "Azure AD tenant ID — from az account show"
  default     = "3f639a9b-27c8-4403-82b1-ebfb88052d15"
}
