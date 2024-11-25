# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-097535b2f600ac08a"
resource "aws_security_group" "bia_dev" {
  description = "regras para instancia bia dev tf"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "liberado 3001"
    from_port        = 3001
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 3001
  }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Acesso SSH"
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
  }]
  name                   = "bia_dev"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = "vpc-0291fea3457442d47"
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-09d39b47b99351e41"
resource "aws_security_group" "bia_db" {
  description = "database"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 5432
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups = [
      aws_security_group.bia_dev.id,
      aws_security_group.bia_ec2.id
    ]
    self    = false
    to_port = 5432
  }]
  name                   = "bia-db"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = "vpc-0291fea3457442d47"
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-03ac575d99beed41a"
resource "aws_security_group" "bia_ec2" {
  description = "allow ec2 bia"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 65535
  }]
  ingress = [{
    cidr_blocks      = []
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = [aws_security_group.bia_alb.id]
    self             = false
    to_port          = 65535
  }]
  name                   = "bia-ec2"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = "vpc-0291fea3457442d47"
}

# __generated__ by Terraform from "sg-0de65af3bfc79df7f"
resource "aws_security_group" "bia_alb" {
  description = "app load balancer security group"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 443
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 443
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
  }]
  name                   = "bia-alb"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = "vpc-0291fea3457442d47"
}

# __generated__ by Terraform from "sg-0926fa37745dddb49"
resource "aws_security_group" "bia_web" {
  description = "bia web"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 443
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 443
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "porta 80 exposta"
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
    }, {
    cidr_blocks      = []
    description      = ""
    from_port        = 80
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
  }]
  name                   = "bia-web"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = "vpc-0291fea3457442d47"
}


