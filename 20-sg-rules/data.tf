# Day 39

data "http" "my_public_ip_v4" {
  url = "https://ipv4.icanhazip.com"
}

output "my_ipv4_address" {
  value = chomp(data.http.my_public_ip_v4.response_body)
}

data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project}/${var.env}/bastion_sg_id"
}


data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.project}/${var.env}/mongodb_sg_id"
}


data "aws_ssm_parameter" "catalogue_sg_id" {
  name = "/${var.project}/${var.env}/catalogue_sg_id"
}


data "aws_ssm_parameter" "user_sg_id" {
  name = "/${var.project}/${var.env}/user_sg_id"
}
