#providing vpc id info which will be fetched using datasource and it will be like roboshop/dev/vpc_id etc..
locals {
    vpc_id = data.aws_ssm_parameter.vpc_id.value
}