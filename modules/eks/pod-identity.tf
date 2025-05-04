resource "aws_eks_pod_identity_association" "ebs-csi" {
  cluster_name    = var.cluster-name
  namespace       = "kube-system"
  service_account = "ebs-csi-controller-sa"
  role_arn        = aws_iam_role.ebs-csi-driver.arn

  depends_on = [aws_eks_cluster.eks-cluster]
}
