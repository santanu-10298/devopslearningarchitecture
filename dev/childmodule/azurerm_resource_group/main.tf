resource "azurerm_resource_group" "rg" {
    for_each = var.rgss
    name = each.value.name
    location = each.value.location
  
}