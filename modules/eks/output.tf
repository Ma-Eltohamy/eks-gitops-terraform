output "ebs-csi-driver-arn" {
  value = aws_iam_role.ebs-csi-driver.arn
}

output "eks-host" {
  value = aws_eks_cluster.eks-cluster.endpoint
}

output "cluster-certificate" {
  value = aws_eks_cluster.eks-cluster.certificate_authority[0].data
}

# ephemeral "output" "cluster-auth-token" {
#   value = ephemeral.aws_eks_cluster_auth.cluster-auth.token
# }
