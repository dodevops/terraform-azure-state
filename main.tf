resource "azurerm_storage_account" "storage-account" {
  name                       = "${lower(var.project)}${lower(var.stage)}stateacc"
  resource_group_name        = var.resource_group
  location                   = var.location
  account_kind               = "StorageV2"
  account_tier               = "Standard"
  account_replication_type   = "ZRS"
  enable_https_traffic_only  = true
  https_traffic_only_enabled = true
  min_tls_version            = "TLS1_2"
  tags                       = var.tags

  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "2.0"
      retention_policy_days = 14
    }
  }

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
