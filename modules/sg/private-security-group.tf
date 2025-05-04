resource "aws_security_group" "private-sg" {
  name        = "private-sg"
  description = "Allow access from public SG"
  vpc_id      = var.vpc-id

  tags = {
    Name = "private-sg"
  }
}
