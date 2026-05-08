output "account_id" {
  value = azurerm_cosmosdb_account.this.id
}

output "endpoint" {
  value = azurerm_cosmosdb_account.this.endpoint
}

output "connection_strings" {
  value     = azurerm_cosmosdb_account.this.connection_strings
  sensitive = true
}

output "account_name" {
  value = azurerm_cosmosdb_account.this.name
}
