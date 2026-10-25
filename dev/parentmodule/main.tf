module "azurerm_resource_group" {
    source = "../childmodule/azurerm_resource_group"
    rgss = var.rgss
}

module "azuerrm_storage_account" {
    depends_on = [ module.azurerm_resource_group ]
    source = "../childmodule/azurerm_storage_account"
    stgss = var.stgss
}