#Will get aws_lb_listener arn details from AWS System manager parameter store
resource "aws_ssm_parameter" "backend_alb_listener_arn" {
  name  = "/${var.project}/${var.environment}/backend_alb_listener_arn"
  type  = "String"
  value = aws_lb_listener.http.arn
}