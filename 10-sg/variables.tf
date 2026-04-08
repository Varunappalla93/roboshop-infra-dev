# Day 38 and 39
variable "project" {
  default = "roboshop"
}


variable "env" {
  default = "dev"
}


variable "sg_names" {
  type = list(any)
  # DB, BE, BE ALB, FE, FE ALB, bastion
  default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "backend_alb", "frontend", "frontend_alb",
  "bastion"]
}
