# creating ssh-key
resource "aws_key_pair" "tf-key" {
  key_name = "ec2-key"
# public_key = "file(${path.module}/ec2-key.pub)"
  public_key = "${file("ec2-key.pub")}"
}
