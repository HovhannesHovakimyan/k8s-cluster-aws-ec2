variable "vpc_cidr_block" {
  description = "CIDR of the VPC network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "common_tags" {
  description = "Common tags to be assigned to all resources"
  type        = map(string)
  default = {
    "Name" = "for-demo"
    "ENV"  = "sandbox"
  }
}

variable "ingress_rules" {
  description = "Inbound rules for the VPC Subnet"
  type        = list(any)
  default = [
    {
      port        = -1
      protocol    = "icmp"
      description = "allow all ICMP"
    },
    {
      port        = 22
      protocol    = "tcp"
      description = "TCP Port 22 allowing SSH connection"
    },
    {
      port        = 80
      protocol    = "tcp"
      description = "TCP Port 80 for HTTP server"
    }
  ]
}

variable "egress_rules" {
  description = "Outbound rules for the VPC network"
  type        = list(any)
  default = [
    {
      port        = 0
      protocol    = -1
      description = "Allowing access to any Internet resource"
    }
  ]
}

variable "subnet_cidr_block" {
  description = "CIDR of the VPC Subnet"
  type        = string
  default     = "10.0.1.0/24"
}
