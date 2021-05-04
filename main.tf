# Azure Storage blob for state storage

resource "azurerm_storage_account" "storage-account" {
  name                      = "${lower(var.project)}${lower(var.stage)}stateacc"
  resource_group_name       = var.resource_group
  location                  = var.location
  account_tier              = "Standard"
  account_replication_type  = "ZRS"
  enable_https_traffic_only = false
}

resource "azurerm_storage_container" "storage-container" {
  name                  = "${lower(var.project)}${lower(var.stage)}statecont"
  storage_account_name  = azurerm_storage_account.storage-account.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "storage-blob" {
  name = "${lower(var.project)}${lower(var.stage)}stateblob"

  storage_account_name   = azurerm_storage_account.storage-account.name
  storage_container_name = azurerm_storage_container.storage-container.name

  type = "Block"
  size = var.size
}
