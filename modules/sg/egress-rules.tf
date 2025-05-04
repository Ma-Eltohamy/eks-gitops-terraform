resource "aws_vpc_security_group_egress_rule" "allow-all-public-outbound-traffic-ipv4" {
  security_group_id = aws_security_group.public-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow-all-private-outbound-traffic-ipv4" {
  security_group_id = aws_security_group.private-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
