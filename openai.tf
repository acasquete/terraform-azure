module "openai" {
  source              = "Azure/openai/azurerm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  private_endpoint = {
    "pe_endpoint" = {
      private_dns_entry_enabled       = true
      dns_zone_virtual_network_link   = "dns_zone_link_openai"
      is_manual_connection            = false
      name                            = "openai_pe"
      private_service_connection_name = "openai_pe_connection"
      subnet_name                     = azurerm_subnet.subnet.name
      vnet_name                       = azurerm_virtual_network.vnet.name
      vnet_rg_name                    = azurerm_resource_group.rg.name
    }
  }
  deployment = {
    "chat_model" = {
      name          = "gpt-35-turbo"
      model_format  = "OpenAI"
      model_name    = "gpt-35-turbo"
      model_version = "0301"
      scale_type    = "Standard"
      capacity      = 120
    },
    "embedding_model" = {
      name          = "text-embedding-ada-002"
      model_format  = "OpenAI"
      model_name    = "text-embedding-ada-002"
      model_version = "2"
      scale_type    = "Standard"
      capacity      = 120
    },
  }
  depends_on = [
    azurerm_resource_group.rg,
     azurerm_subnet.subnet,
    
  ]
}

