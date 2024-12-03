output "igw_name" {
  value = aws_internet_gateway.igw.tags["Name"]
}

output "vpc_name" {
  value = aws_vpc.main.tags["Name"]
}

output "cidr_block" {
  value = aws_vpc.main.cidr_block
}
