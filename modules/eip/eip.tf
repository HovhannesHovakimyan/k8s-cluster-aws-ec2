resource "aws_eip" "main" {
  instance = var.ec2_id
  vpc      = true

  tags = var.tags
}
