provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block = var.vpc_cidr_block
  tags           = var.common_tags
}

data "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}

module "subnet" {
  source = "./modules/subnet"

  vpc_id            = data.aws_vpc.main.id
  subnet_cidr_block = var.subnet_cidr_block
  tags              = var.common_tags
}

module "sg" {
  source = "./modules/security_group"

  vpc_id        = data.aws_vpc.main.id
  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
  tags          = var.common_tags
}

module "nic" {
  source = "./modules/nic"

  subnet_id = module.subnet.subnet_id
  tags      = var.common_tags
}

data "aws_security_group" "AppSrvSecGrp" {
  name = module.sg.sg_name
}

module "ec2" {
  source = "./modules/ec2"

  subnet_id = module.subnet.subnet_id
  nic_id    = module.nic.nic_id
  sg_id     = data.aws_security_group.AppSrvSecGrp.id
  tags      = var.common_tags
}
