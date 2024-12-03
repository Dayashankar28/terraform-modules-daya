resource "null_resource" "name" {
    provisioner "local-exec" {
        command = "echo ${var.ec2_public_ip} > conf/public_ip.txt"
    }
}