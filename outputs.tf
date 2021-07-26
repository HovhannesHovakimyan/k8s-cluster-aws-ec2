output "vpc_id" {
  value = module.vpc.vpc_id
}

output "sg_id" {
  value = module.sg.sg_id
}

output "subnet_id" {
  value = module.subnet.subnet_id
}

output "ec2_nic_id" {
  value = module.nic.nic_id
}

output "ec2_public_ip" {
  value = module.ec2.ec2_public_ip
}

output "ec2_public_dns" {
  value = module.ec2.ec2_public_dns
}
