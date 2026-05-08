resource "azurerm_mysql_flexible_server" "this" {
  name                   = var.server_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  sku_name               = var.sku_name
  version                = var.mysql_version

  storage {
    size_gb           = var.storage_size_gb
    auto_grow_enabled = true
  }

  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = false

  tags = var.tags

  lifecycle {
    # Azure does not return the password in API responses; ignore post-import drift
    ignore_changes = [
      administrator_password,
      zone,
    ]
  }
}
