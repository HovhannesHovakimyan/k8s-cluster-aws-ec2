resource "aws_main_route_table_association" "a" {
  vpc_id         = var.vpc_id
  route_table_id = var.rt_id
}
