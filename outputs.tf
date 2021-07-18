output "vpc_id" {
  value = module.vpc.vpc_id
}

output "sg_id" {
  value = module.sg.sg_id
}

output "subnet_id" {
  value = module.subnet.subnet_id
}
