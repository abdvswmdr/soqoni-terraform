output "cluster_name" {
  value = azurerm_kubernetes_cluster.this.name
}

output "cluster_id" {
  value = azurerm_kubernetes_cluster.this.id
}

output "kubelet_identity" {
  description = "Object ID of the kubelet managed identity — referenced in Key Vault role assignments"
  value       = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}
