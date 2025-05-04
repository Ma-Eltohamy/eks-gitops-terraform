resource "aws_eks_addon" "ebs-csi-driver-addon" {
  cluster_name             = var.cluster-name
  addon_name               = "aws-ebs-csi-driver"
  service_account_role_arn = aws_iam_role.ebs-csi-driver.arn
  depends_on               = [aws_eks_cluster.eks-cluster, aws_eks_node_group.private-nodes]
}
