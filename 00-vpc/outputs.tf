# Day 38

# this prints the output, and now users should catch and store in SSM parameter store
output "vpc_id" {
  value = module.vpc.vpc_id
}