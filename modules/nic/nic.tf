resource "aws_network_interface" "nic-public" {
  subnet_id = var.subnet_id

  tags = var.tags
}
