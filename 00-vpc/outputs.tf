# Day 38

# this prints the output, and now users should catch and store in SSM parameter store
output "vpc_id" {
    value = module.vpc.vpc_id
}

output "public_subnet_ids" {
    value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
    value = module.vpc.private_subnet_ids
}

output "database_subnet_ids" {
    value = module.vpc.database_subnet_ids
}