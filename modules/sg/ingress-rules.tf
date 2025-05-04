# "Allow inbound HTTP, HTTPS and SSH"
# I used the aws_vpc_security_group_ingress_rule insted of ingress and egress blocks inside the security group block
# because as terraform docs mentioned they cause a lot of confilects

# public security group
resource "aws_vpc_security_group_ingress_rule" "allow-https-ipv4" {
  security_group_id = aws_security_group.public-sg.id
  cidr_ipv4         = var.cidr-block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow-http-ipv4" {
  security_group_id = aws_security_group.public-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow-ssh-ipv4" {
  security_group_id = aws_security_group.public-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# private security group
resource "aws_vpc_security_group_ingress_rule" "allow-internal-communication" {
  security_group_id = aws_security_group.private-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  ip_protocol       = "tcp"
  to_port           = 65535
}
