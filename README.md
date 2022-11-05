
# terraform-azurerm-linuxvm

## This module is for learning purposes.



StackSimplify
-------------
https://github.com/stacksimplify/terraform-on-azure-cloud/tree/main/11-Azure-Linux-Virtual-Machine

<br>


Se also
-------
https://github.com/kumarvna/terraform-azurerm-vnet

<br>

List of all VM images
---------------------
https://docs.microsoft.com/en-US/cli/azure/vm/image?view=azure-cli-latest#az_vm_image_list

For Ubuntu images:
az vm image list --location northeurope -f Ubuntu --architecture x64 --publisher canonical --all


<br>

Generate RSA keys
-----------------

a) Using Terraform provider
---------------------------
resource "tls_private_key" "ssh_keys" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

Then use local provisioner to save private key:

provisioner "local-exec" {   
    command = <<-EOT
      echo '${tls_private_key.ssh_keys.private_key_pem}' > privatekey.pem
      chmod 400 privatekey.pem
    EOT
}


b) Using ssh-keygen (Linux)
---------------------------
ssh-keygen \
    -m PEM \
    -t rsa \
    -b 4096 \
    -C "malloy@linux" \
    -f key 


c) Using ssh-keygen (Windows)
-----------------------------
ssh-keygen `
    -m PEM `
    -t rsa `
    -b 4096 `
    -C "malloy@linux" `
    -f key 


The private key will be stored in "./key" file and has to have "400" permissions!


Access to the VM
----------------
ssh -i ./key malloy@x.y.z.w

