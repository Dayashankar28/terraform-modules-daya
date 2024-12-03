# output "ami_id" {
#   value = data.aws_ami.ubuntu.id
# }

# output "security_groups" {
#     value = data.aws_security_group.default.name
  
# }

output "ec2_public_ip" {
  value = aws_instance.create_ec2.public_ip
}