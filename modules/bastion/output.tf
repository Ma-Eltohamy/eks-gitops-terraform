output "bastion-public-ip" {
  value = aws_instance.bastion.public_ip
}
