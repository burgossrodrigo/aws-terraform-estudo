terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
    }
  }

    required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
  profile = "bia" 
}

resource "aws_instance" "bia-dev" {
    ami = "ami-02f3f602d23f1659d"
    instance_type = "t3.micro"
    tags = {
      ambiente = "dev"
      Name = var.instance_name
    }

    vpc_security_group_ids = [aws_security_group.example.id]

    root_block_device {
        volume_size = 10
    }
}

resource "aws_security_group" "example" {
  name = "bia-dev-tf"
  description = "regras"
  vpc_id = "vpc-0291fea3457442d47"

  ingress {
    description = "liberado 3001"
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # egress {
  #   from_port        = 0
  #   to_port          = 0
  #   protocol         = "-1"
  #   cidr_blocks      = ["0.0.0.0/0"]
  #   ipv6_cidr_blocks = ["::/0"]
  # }
}

