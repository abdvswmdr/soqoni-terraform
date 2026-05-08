output "server_id" {
  value = azurerm_mysql_flexible_server.this.id
}

output "server_fqdn" {
  value = azurerm_mysql_flexible_server.this.fqdn
}

output "server_name" {
  value = azurerm_mysql_flexible_server.this.name
}
