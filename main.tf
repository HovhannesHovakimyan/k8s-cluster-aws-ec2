provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

locals {
  ssh_user         = "ubuntu" // For an Ubuntu AMI, the user name is ubuntu.
  key_name         = "for-demo"
  private_key_path = "./keypair/for-demo.pem"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block = var.vpc_cidr_block
  tags           = var.common_tags
}

data "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  depends_on = [
    module.vpc
  ]
}

module "igw" {
  source = "./modules/igw"

  vpc_id = data.aws_vpc.main.id
  tags   = var.common_tags
}

module "eip" {
  source = "./modules/eip"

  ec2_id = module.ec2.ec2_id
  tags   = var.common_tags

  depends_on = [
    module.igw // It's recommended to denote that the AWS Instance or Elastic IP depends on the Internet Gateway.
  ]
}

module "route_table" {
  source = "./modules/route_table"

  vpc_id     = data.aws_vpc.main.id
  gateway_id = module.igw.gateway_id
  tags       = var.common_tags
}

module "vpc_to_rt" {
  source = "./modules/vpc_to_rt"
  
  vpc_id     = data.aws_vpc.main.id
  rt_id      = module.route_table.rt_id
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

  depends_on = [
    module.sg
  ]
}

module "ec2" {
  source = "./modules/ec2"

  subnet_id = module.subnet.subnet_id
  nic_id    = module.nic.nic_id
  sg_id     = data.aws_security_group.AppSrvSecGrp.id
  key_name  = local.key_name
  tags      = var.common_tags

  depends_on = [
    module.igw // It's recommended to denote that the AWS Instance or Elastic IP depends on the Internet Gateway.
  ]
}
