# Day 38 and 39

module "sg" {
  count   = length(var.sg_names)
  source  = "../../Terraform-aws-sg"
  project = var.project
  env     = var.env
  sg_name = replace(var.sg_names[count.index], "_", "-")
  vpc_id  = local.vpc_id
}
