resource "aws_key_pair" "tf_key" {
    key_name   = "tf-key"
    public_key = tls_private_key.rsa.public_key_openssh
    tags = {
        managed_by = "terraform-managed"
        }
}

# RSA key of size 4096 bits
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# create local file to store private key
resource "local_file" "tf-key" {
  content = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}
