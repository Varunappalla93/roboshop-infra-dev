# Day 38

module "sg" {
  source = "../../Terraform-aws-sg"
  project = var.project
  env=var.env
  sg_name = "mongodb"
  vpc_id= local.vpc_id
}