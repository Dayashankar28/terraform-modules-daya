resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "tf-vpc"
  }
}


// Create Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

   tags = {
    Name = "tf-igw"
  }
}