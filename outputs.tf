output "instance_id" {
  description = "ID da EC2"
  value = aws_instance.bia-dev.id
}

output "instance_type" {
  description = "Tipo da EC2"
  value = aws_instance.bia-dev.instance_type
}

output "instance_security_group" {
  description = "Security group da EC2"
  value = aws_instance.bia-dev.security_groups
}

output "instance_public_ip" {
  description = "IP publico da EC2"
  value = aws_instance.bia-dev.public_ip
}

output "instance_private_ip" {
  description = "IP privado da EC2"
  value = aws_instance.bia-dev.private_ip
}