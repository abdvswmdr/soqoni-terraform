resource "azurerm_mysql_flexible_server" "this" {
  name                   = var.server_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  sku_name               = var.sku_name
  version                = var.mysql_version

  storage {
    size_gb                  = var.storage_size_gb
    auto_grow_enabled        = true
    auto_io_scaling_enabled  = true
    io_scaling_enabled       = true
  }

  backup {
    retention_days              = var.backup_retention_days
    geo_redundant_backup_enabled = false
  }

  high_availability {
    mode = "Disabled"
  }

  tags = var.tags

  lifecycle {
    # Azure does not return the password in API responses; ignore post-import drift
    ignore_changes = [
      administrator_password,
      zone,
      high_availability[0].standby_availability_zone,
    ]
  }
}
