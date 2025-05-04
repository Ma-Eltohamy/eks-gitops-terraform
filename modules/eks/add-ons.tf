resource "aws_eks_addon" "eks-addon" {
  cluster_name = var.cluster-name
  count        = length(var.add-ons)
  addon_name   = var.add-ons[count.index]

  depends_on = [aws_eks_cluster.eks-cluster, aws_eks_node_group.private-nodes]
}
