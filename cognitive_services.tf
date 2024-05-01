resource "azurerm_cognitive_account" "cognitive_service" {
  name                = "cogsrv-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = var.sku
  kind                = "CognitiveServices"
}