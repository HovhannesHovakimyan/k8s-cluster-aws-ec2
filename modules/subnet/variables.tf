variable "vpc_id" {
  type = string
}

variable "subnet_cidr_block" {
  type = string
}

variable "tags" {
  type = map(string)
}
