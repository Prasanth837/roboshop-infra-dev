
#fetching vpc module "terraform-aws-vpc" using source
module "vpc" {
    source = "git::https://github.com/daws-88s/terraform-aws-vpc.git?ref=main"
    project = var.project
    environment = var.environment
    is_peering_required = true  #vpc peering will be created 
}