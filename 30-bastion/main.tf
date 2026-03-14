# Day 39

resource "aws_instance" "bastion" {
  ami                    = local.ami_id
  instance_type          = "t3.micro"
  subnet_id              = local.public_subnet_id
  vpc_security_group_ids = [local.bastion_sg_id]
  tags = merge(
    {
      Name = "${var.project}-${var.env}-bastion"
    },
    local.common_tags
  )
}
