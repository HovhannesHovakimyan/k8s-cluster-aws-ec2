resource "aws_subnet" "main" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = true

  tags = var.tags
}
