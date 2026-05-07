output "resource_group_name" {
  value = module.resource_group.name
}

output "resource_group_location" {
  value = module.resource_group.location
}

output "aks_cluster_name" {
  value = module.aks.cluster_name
}

output "aks_kubelet_identity" {
  description = "Object ID of the kubelet managed identity — used for Key Vault role assignments"
  value       = module.aks.kubelet_identity
}

output "aks_get_credentials_cmd" {
  description = "Command to configure kubectl for this cluster"
  value       = "az aks get-credentials --resource-group ${module.resource_group.name} --name ${module.aks.cluster_name} --overwrite-existing"
}
