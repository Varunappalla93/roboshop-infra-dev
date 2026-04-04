# Day 38

module "vpc" {
  source      = "git::https://github.com/Varunappalla93/Terrform-AWS-VPC.git?ref=main"
  project     = var.project
  environment = var.env
  is_peering_required=false
}


# to run all at once
# for i in 00-vpc/ 10-sg/ 20-sg-rules/ 30-bastion/; do cd $i; terraform apply -auto-approve; cd ..;done