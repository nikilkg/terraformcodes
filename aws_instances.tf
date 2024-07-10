resource "aws_instance" "ec2-01" {
    tags = {
      name = "server1"
      managed_by = "terraform-managed"
    }
    ami = "ami-01376101673c89611"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.tf-subnet-pub-01.id
    key_name = "tf-key-01"
    count = 1
}
