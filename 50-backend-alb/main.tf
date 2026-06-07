#creating backend application load balancer using terraform resource.
resource "aws_lb" "backend_alb" {
  name               = "${var.project}-${var.environment}" # roboshop-dev
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id] # fetches locals information for sg id and private subnet details
  subnets            = local.private_subnet_ids

  # keeping it as false, just to delete using terraform while practice
  enable_deletion_protection = false

  tags = merge(
    {
        Name = "${var.project}-${var.environment}"
    },
    local.common_tags
  )
}
#creating backend application load balancer listener using terraform resource.
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.backend_alb.arn #load balance arn details can be fetched using aws ssm
  port              = "80"
  protocol          = "HTTP"

#so far using default action as fixed action as we don't have target groups yet.
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hi, I am from HTTP Backend ALB</h1>"
      status_code  = "200"
    }
  }
}

#Creating aws route 53 records
resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "*.backend-alb-${var.environment}.${var.domain_name}"
  type    = "A"
  
  # load balancer details
  alias {
    name                   = aws_lb.backend_alb.dns_name
    zone_id                = aws_lb.backend_alb.zone_id
    evaluate_target_health = true
  }
}