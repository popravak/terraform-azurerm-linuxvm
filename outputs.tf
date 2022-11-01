
output "public_ip_address" {
  value = azurerm_linux_virtual_machine.linuxvm.public_ip_address
}

/*
output "ssh_public_key" {
  value = azurerm_linux_virtual_machine.linuxvm.admin_ssh_key
}
*/
