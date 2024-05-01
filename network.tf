# Create the VNET
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  address_space       = ["10.52.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    environment = "dev"
  }
}

# Create a DB subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet0"
  address_prefixes     = ["10.52.0.0/16"]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name

  private_endpoint_network_policies_enabled = true
}
