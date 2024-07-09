resource "aws_vpc" "tf-vpc-01" {
  cidr_block = "172.31.0.0/16"
  tags = {
    name       = "tf-vpc-business-01"
    managed_by = "terraform-managed"
  }
}

# create public subnet
resource "aws_subnet" "tf-subnet-pub-01" {
  vpc_id     = aws_vpc.tf-vpc-01.id
  cidr_block = "172.31.0.0/18"
  tags = {
    name       = "tf-subnet-public-01"
    managed_by = "terraform-managed"
  }
}
# create private subnet
resource "aws_subnet" "tf-subnet-pvt-01" {
  vpc_id     = aws_vpc.tf-vpc-01.id
  cidr_block = "172.31.64.0/18"
  tags = {
    name       = "tf-subnet-private-01"
    managed_by = "terraform-managed"
  }

}
# create igw
resource "aws_internet_gateway" "tf-igw-01" {
  vpc_id = aws_vpc.tf-vpc-01.id
  tags = {
    name       = "tf-igw-01"
    managed_by = "terraform-managed"
  }
}
# create route-table
resource "aws_route_table" "tf-rt-01" {
  vpc_id = aws_vpc.tf-vpc-01.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-igw-01.id
  }
}
# associate rout table to subnet
resource "aws_route_table_association" "tf-rt-assoc-01" {
  subnet_id      = aws_subnet.tf-subnet-pub-01.id
  route_table_id = aws_route_table.tf-rt-01.id
}
