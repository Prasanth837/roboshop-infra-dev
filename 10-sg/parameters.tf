/* resource "aws_ssm_parameter" "mongodb_sg_id" {
  name  = "/${var.project}/${var.environment}/mongodb_sg_id"
  type  = "String"
  value = module.sg.sg_id
} */
#Creating aws ssm parameter resource for security group id
resource "aws_ssm_parameter" "sg_id" {
  count = length(var.sg_names) #Create this resource/module as many times as the number of security group names in the list.”
  #“Dynamically create a parameter/resource name using project name, environment, and security group name.”
  name  = "/${var.project}/${var.environment}/${var.sg_names[count.index]}_sg_id"
  type  = "String"
  value = module.sg[count.index].sg_id #Get the sg_id output from the current sg module instance.”
}