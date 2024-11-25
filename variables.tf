variable "instance_name" {
  type        = string
  description = "Nome da instancia EC2"
  default     = "bia_dev-tf"
}

variable "key_name" {
  type        = string
  description = "Nome da chave para acesso SSH"
  default     = "bia_key"
}

variable "subnet_id" {
  type        = string
  description = "ID da subnet"
  default     = "subnet-0e198d58388244c95"
}