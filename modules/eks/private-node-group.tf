resource "aws_eks_node_group" "private-nodes" {
  cluster_name    = var.cluster-name
  node_group_name = var.node-group-name
  node_role_arn   = aws_iam_role.eks-worker-role.arn
  subnet_ids      = var.private-subnet-ids
  instance_types  = var.instence-types
  scaling_config {
    desired_size = var.scaling-config["desired-size"]
    max_size     = var.scaling-config["max-size"]
    min_size     = var.scaling-config["min-size"]
  }

  depends_on = [aws_eks_cluster.eks-cluster]

  tags = {
    Name = var.node-group-name
  }
}
