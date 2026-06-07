variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}
#zone_id is needed to create r53 records
variable "zone_id" {
    default = "Z1037585THT3IBZCMEU3"
}
#domain name details which we got from hostinger
variable "domain_name" {
    default = "abstractglobal.online"
}