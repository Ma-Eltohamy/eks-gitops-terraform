# This will generate:
# A private key (tls_private_key.bastion_key.private_key_pem)
# A public key (tls_private_key.bastion_key.public_key_openssh)

resource "tls_private_key" "bastion-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# this resource will create a key pair in aws using the premaded key 
resource "aws_key_pair" "bastion-key" {
  key_name   = "bastion-key"
  public_key = tls_private_key.bastion-key.public_key_openssh
}

# we are using the local file resource to make terraform save the private key of the premaded one
resource "local_file" "private_key_pem" {
  content         = tls_private_key.bastion-key.private_key_pem
  filename        = "${path.module}/bastion-key.pem"
  file_permission = "0600"
}
