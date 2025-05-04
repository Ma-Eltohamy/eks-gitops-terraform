resource "aws_eks_cluster" "eks-cluster" {
  name     = var.cluster-name
  role_arn = aws_iam_role.eks-control-plane-role.arn

  vpc_config {
    subnet_ids              = var.private-subnet-ids
    security_group_ids      = var.private-sg-ids
    endpoint_private_access = false
    endpoint_public_access  = true
  }

  tags = {
    Name = var.cluster-name
  }
}
