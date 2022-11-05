
output "public_ip_address" {
  description = "VM public IP"
  value       = azurerm_linux_virtual_machine.linuxvm.*.public_ip_address
}
