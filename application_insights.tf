
# application_insights
# Create a new Application Insights within the resource group
resource "azurerm_application_insights" "example" {
  name                = "appinsights-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}

# Export the Instrumentation Key of the Application Insights instance
output "instrumentation_key" {
  value = azurerm_application_insights.example.instrumentation_key
  sensitive = true
}
