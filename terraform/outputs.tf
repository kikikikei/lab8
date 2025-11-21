output "vnet_name" {
  value = azurerm_virtual_network.example.name
}

output "subnet_cidr" {
  value = azurerm_subnet.example.address_prefixes
}
