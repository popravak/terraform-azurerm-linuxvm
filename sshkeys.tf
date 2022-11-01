/*
resource "tls_private_key" "ssh_keys" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

provisioner "local-exec" {   
    command = <<-EOT
      echo '${tls_private_key.ssh_keys.private_key_pem}' > privatekey.pem
      chmod 400 privatekey.pem
    EOT
}
*/
