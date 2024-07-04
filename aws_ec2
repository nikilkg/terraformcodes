resource "aws_instance" "ec2-free" {
    tags = {
      name = "server1"
      department = "finance"
    }
    ami = "ami-01376101673c89611"
    instance_type = "t2.micro"
    subnet_id = "subnet-0cee7a5a0949da16d"
    key_name = "ec2-key"
    vpc_security_group_ids = ["sg-075eda11043191529", "sg-0201cd65b37a659e3"]
    count = 1
}
