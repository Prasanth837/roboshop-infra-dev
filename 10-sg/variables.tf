#creates project details using variable
variable "project" {
    default = "roboshop"
}
#creates environment details using variable
variable "environment" {
    default = "dev"
}
#creates security group details using variable and use these variables to create security groups by using security group modules and count
variable "sg_names" {
    type = list
    default = [
        # Databases
        "mongodb", "redis", "mysql", "rabbitmq",
        # Backend
        "catalogue", "user", "cart", "shipping", "payment",
        # Backend ALB
        "backend_alb",
        # Frontend
        "frontend",
        # Frontend ALB
        "frontend_alb",
        # Bastion
        "bastion",
        # Openvpn
        "openvpn"
    ]
}