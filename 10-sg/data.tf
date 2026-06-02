data "aws_ssm_parameter" "vpc_id" {
    name = "/${var.project}/${var.environment}/vpc_id"  #roboshop is project and environemnt is dev/prod etc.
}