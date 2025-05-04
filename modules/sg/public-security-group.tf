resource "aws_security_group" "public-sg" {
  name        = "public-sg"
  description = "Allow inbound HTTP, HTTPS and SSH"
  vpc_id      = var.vpc-id

  tags = {
    Name = "public-sg"
  }
}
