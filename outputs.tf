output "instance_id" {
  description = "ID da EC2"
  value = aws_instance.bia_dev.id
}

output "instance_type" {
  description = "Tipo da EC2"
  value = aws_instance.bia_dev.instance_type
}

output "instance_security_group" {
  description = "Security group da EC2"
  value = aws_instance.bia_dev.security_groups
}

output "db_security_group" {
  description = "Security group do banco de dados"
  value = aws_security_group.bia_db.id
}

output "instance_public_ip" {
  description = "IP publico da EC2"
  value = aws_instance.bia_dev.public_ip
}

output "instance_private_ip" {
  description = "IP privado da EC2"
  value = aws_instance.bia_dev.private_ip
}

output "rds_endpoint" {
  description = "Endpoint do banco de dados"
  value = aws_db_instance.bia.endpoint
}