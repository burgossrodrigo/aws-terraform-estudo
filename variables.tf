variable "instance_name" {
  type        = string
  description = "Nome da instancia EC2"
  default     = "bia_dev_tf"
}

variable "key_name" {
  type        = string
  description = "Nome da chave para acesso SSH"
  default     = "bia_key"
}

variable "subnet_id_b" {
  type        = string
  description = "ID da subnet B"
  default     = "subnet-0aa98ddfa4a07b32d"
}

variable "subnet_id_a" {
  type        = string
  description = "ID da subnet A"
  default     = "subnet-01f3ed43330d1f97d"
}

variable "vpc_id" {
  type        = string
  description = "ID da VPC"
  default     = "vpc-0d84787c58a1fa2c0"
}

# locals {
#   vpc_id        = "vpc-0d84787c58a1fa2c0"
#   subnet_zona_b = "subnet-0aa98ddfa4a07b32d"
# }