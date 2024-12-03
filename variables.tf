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
  default     = "subnet-0e198d58388244c95"
}

variable "subnet_id_a" {
  type        = string
  description = "ID da subnet A"
  default     = "subnet-09f7712bbec036f47"
}