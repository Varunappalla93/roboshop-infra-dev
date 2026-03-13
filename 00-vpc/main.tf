# Day 38

module "vpc" {
  source      = "https://github.com/Varunappalla93/Terrform-AWS-VPC.git?ref=main"
  project     = var.project
  environment = var.env
  is_peering_required=true
}