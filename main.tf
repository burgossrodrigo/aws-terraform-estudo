resource "aws_instance" "bia_dev" {
  ami           = "ami-02f3f602d23f1659d"
  instance_type = "t3.micro"
  tags = {
    ambiente = "dev"
    Name     = var.instance_name
  }

  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  ipv6_address_count          = 1

  vpc_security_group_ids = [aws_security_group.bia_dev.id]
  iam_instance_profile   = aws_iam_instance_profile.role_acesso_ssm.name

  root_block_device {
    volume_size = 10
  }

  key_name  = var.key_name
  user_data = file("user_data.sh")
}

