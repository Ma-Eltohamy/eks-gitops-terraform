resource "aws_eip" "lb" {
  public_ipv4_pool = "amazon" # Default AWS pool
  domain           = "vpc"
}
