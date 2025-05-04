resource "aws_instance" "bastion" {
  ami                    = "ami-0129865974a10c1cb" # The specific aim-id at the used region
  instance_type          = var.instance-type
  subnet_id              = var.public-subnet-id
  vpc_security_group_ids = [var.public-sg-id]

  associate_public_ip_address = true

  key_name = aws_key_pair.bastion-key.key_name

  tags = {
    Name = "bastion-host"
  }
}
#
# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners      = ["099720109477"] # Canonical's owner ID for Ubuntu
#
#   filter {
#     name   = "name"
#     values = ["ubuntu-*x86_64-gp2"] # This is a more general pattern for Ubuntu images
#   }
# }
