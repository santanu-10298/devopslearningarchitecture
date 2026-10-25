resource "azurerm_storage_account" "stg" {
    for_each = var.stgss
  name = each.value.name
  resource_group_name = each.value.rg_name
  location = each.value.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}