# Day 45

locals {
  common_tags = {
        Project = var.project
        Environment = var.env
        Terraform = "true"
    }
}