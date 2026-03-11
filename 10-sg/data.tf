data "aws_ssm_parameter" "main" {
   name  = "/${var.project}/${var.env}/vpc_id"
   
}