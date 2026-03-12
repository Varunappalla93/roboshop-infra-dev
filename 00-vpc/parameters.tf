# Day 38

# creates ssm parameter, eg: /roboshop/dev/vpc_id
resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project}/${var.env}/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id
}