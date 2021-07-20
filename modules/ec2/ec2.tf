resource "aws_instance" "app_server" {
  ami           = "ami-09e67e426f25ce0d7" // Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.micro"              // Free tier eligible

  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.sg_id]
  tags                        = var.tags
}
