# Day 42

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0" # terraform aws provider version
    }
  }

  backend "s3" {
    bucket       = "remote-state-dev-var" # bucket must be created in aws s3 before running terraform init
    key          = "roboshop-dev-backend-alb"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1"
}

