# Day 38

module "vpc" {
  source      = "../../Terrform-AWS-VPC"
  project     = var.project
  environment = var.env
  is_peering_required=true
}