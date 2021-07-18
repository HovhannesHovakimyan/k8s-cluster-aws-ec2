provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block = var.vpc_cidr_block
  tags           = var.common_tags
}

module "sg" {
  source = "./modules/sg"

  vpc_id        = module.vpc.vpc_id
  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
  tags          = var.common_tags
}

module "subnet" {
  source = "./modules/subnet"

  vpc_id            = module.vpc.vpc_id
  subnet_cidr_block = var.subnet_cidr_block
  tags              = var.common_tags
}
