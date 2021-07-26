resource "aws_instance" "app_server" {
  ami           = "ami-09e67e426f25ce0d7" // Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.micro"              // Free tier eligible

  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.sg_id]
  key_name                    = var.key_name
  tags                        = var.tags

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_key_path)
      host        = aws_instance.app_server.public_ip
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook  -i ${aws_instance.app_server.public_ip}, --private-key ${var.private_key_path} ${var.ansible_file_path}"
  }
}
