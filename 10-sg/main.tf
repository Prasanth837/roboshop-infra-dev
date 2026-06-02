
#creating security groups using security group module "terraform-aws-sg"
module "sg" {
    count = length(var.sg_names) #create security groups as per variable declaration by iterating using count
    source = "../../terraform-aws-sg"  #getting security group module code using source and providing the path
    project = var.project
    environment = var.environment
    sg_name = replace(var.sg_names[count.index], "_", "-")  # Take the current security group name and replace underscores (_) with hyphens (-).”
    vpc_id = local.vpc_id         #fetching vpc id info from locals
}