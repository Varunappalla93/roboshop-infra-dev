# Day 38

# get ssm parameter using data source
data "aws_ssm_parameter" "main" {
   name  = "/${var.project}/${var.env}/vpc_id"
   
}