variable "nic_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "sg_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "private_key_path" {
  type = string
}

variable "ansible_file_path" {
  type = string
}

variable "ssh_user" {
  type = string
}

variable "tags" {
  type = map(string)
}
