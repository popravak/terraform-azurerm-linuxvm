
module "rg" {
  source  = "popravak/rg/azurerm"
  version = "1.0.2"
}

module "vnet" {
  source  = "popravak/vnet/azurerm"
  version = "1.0.3"
  rg_name = module.rg.rg_name
}
  
resource "random_string" "random" {
  min_lower   = 2
  min_upper   = 2
  min_numeric = 2
  length      = 6
}

resource "azurerm_public_ip" "pip" {
  name                = "pip-${var.business_unit_prefix}-${var.environment_prefix}-${random_string.random.result}"
  resource_group_name = module.rg.rg_name
  location            = module.rg.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "iface" {
  name                = "iface-${var.business_unit_prefix}-${var.environment_prefix}-${random_string.random.result}"
  location            = module.rg.location
  resource_group_name = module.rg.rg_name

  ip_configuration {
    name                          = "ipconfig-${var.business_unit_prefix}-${var.environment_prefix}-${random_string.random.result}"
    subnet_id                     = module.vnet.subnet_ids[0]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "linuxvm" {
  name                            = var.vmname
  resource_group_name             = module.rg.rg_name
  location                        = module.rg.location
  size                            = var.vmsize
  admin_username                  = var.vmadmin
  disable_password_authentication = true
  network_interface_ids = [
    azurerm_network_interface.iface.id,
  ]

  admin_ssh_key {
    username   = var.vmadmin
    public_key = file("./key.pub")
    //public_key = tls_private_key.ssh_keys.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = var.vmosdisksize
  }

  source_image_reference {
    publisher = var.vmpublisher
    offer     = var.vmoffer
    sku       = var.vmsku
    version   = var.vmversion
  }
}
