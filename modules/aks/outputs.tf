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

output "cluster_endpoint" {
  value     = azurerm_kubernetes_cluster.this.kube_config[0].host
  sensitive = true
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.this.kube_config[0].client_certificate
  sensitive = true
}

output "client_key" {
  value     = azurerm_kubernetes_cluster.this.kube_config[0].client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = azurerm_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate
  sensitive = true
}
