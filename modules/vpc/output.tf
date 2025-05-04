output "vpc-id" {
  value = aws_vpc.main.id
}

output "cidr-block" {
  value = var.vpc-cidr-block
}

output "private-subnet-ids" {
  value = aws_subnet.public[*].id
}

output "bastion-subnet-id" {
  value = aws_subnet.public[0].id
}
