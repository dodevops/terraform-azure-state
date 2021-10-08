resource "azurerm_storage_account" "storage-account" {
  name                      = "${lower(var.project)}${lower(var.stage)}stateacc"
  resource_group_name       = var.resource_group
  location                  = var.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "ZRS"
  enable_https_traffic_only = true
  allow_blob_public_access  = false
  min_tls_version           = "TLS1_2"
  tags                      = var.tags

  blob_properties {
    delete_retention_policy {
      days = var.delete_retention_policy
    }
  }
}

resource "azurerm_storage_container" "storage-container" {
  name                  = "${lower(var.project)}${lower(var.stage)}statecont"
  storage_account_name  = azurerm_storage_account.storage-account.name
  container_access_type = "private"
}
