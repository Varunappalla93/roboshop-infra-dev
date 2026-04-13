# Day 39, 40, 41, 42

resource "aws_security_group_rule" "bastion_internet" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  # or
    # cidr_blocks = [local.my_ip]

  # which SG you are creating this rule
  security_group_id = local.bastion_sg_id
}


# mongodb accepting connection from bastion
resource "aws_security_group_rule" "mongodb_bastion" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  # where traffic is coming from
  source_security_group_id = local.bastion_sg_id
  # where to insert it
  security_group_id        = local.mongodb_sg_id
}

# mongodb accepting connection from catalogue
resource "aws_security_group_rule" "mongodb_catalogue" {
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  source_security_group_id = local.catalogue_sg_id
  security_group_id        = local.mongodb_sg_id
}


# mongodb accepting connection from user
resource "aws_security_group_rule" "mongodb_user" {
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  source_security_group_id = local.user_sg_id
  security_group_id        = local.mongodb_sg_id
}

# redis should allow connection from bastion on port 22
resource "aws_security_group_rule" "redis_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.redis_sg_id
}

resource "aws_security_group_rule" "mysql_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.mysql_sg_id
}


# RabbitMQ
resource "aws_security_group_rule" "rabbitmq_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.rabbitmq_sg_id
}

# load balancer -> 80 - http, 443 - https
# target group - group of instances
# launch template - template to launch instances
# autoscaling - uses launch template as input, can trigger instance if CPU utilisation is more than 70%
# rules - catalogue.* - redirects to catalogue target group
# health check - check instance is available or not
# Application LB is better than classic LB

#backend alb accepting traffic from bastion
resource "aws_security_group_rule" "backend_alb_bastion" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.backend_alb_sg_id
}


resource "aws_security_group_rule" "catalogue_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.catalogue_sg_id
}


resource "aws_security_group_rule" "catalogue_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.backend_alb_sg_id
  security_group_id = local.catalogue_sg_id
}
