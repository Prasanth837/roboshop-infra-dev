terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.33.0" # Terraform AWS provider version
    }
  }
  #remote state file will be created as per below s3 information
  backend "s3" {
    bucket  = "remote-state-aws-daws88s-dev" # Replace with your unique bucket name
    key     = "roboshop-dev-vpc"
    region  = "us-east-1"
    encrypt = true
    use_lockfile   = true
  }
}
#provider region
provider "aws" {
  region = "us-east-1"
}