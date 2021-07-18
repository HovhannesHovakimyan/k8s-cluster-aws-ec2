resource "aws_instance" "app_server" {
  ami           = "ami-09e67e426f25ce0d7" // Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.micro"              // Free tier eligible

  tags = {
    Name = "for-demo"
  }
}
