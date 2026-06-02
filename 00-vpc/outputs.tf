#prints the vpc id information as per vpc module
output "vpc_id" {
    value = module.vpc.vpc_id
}
#prints the public subnet id information as per vpc module
output "public_subnet_ids" {
    value = module.vpc.public_subnet_ids
}
#prints the private subnet id information as per vpc module
output "private_subnet_ids" {
    value = module.vpc.private_subnet_ids
}
#prints the database subnet id information as per vpc module
output "database_subnet_ids" {
    value = module.vpc.database_subnet_ids
}