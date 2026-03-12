# Day 38

# gets vpc id value
locals {
  vpc_id=data.aws_ssm_parameter.main.value
}