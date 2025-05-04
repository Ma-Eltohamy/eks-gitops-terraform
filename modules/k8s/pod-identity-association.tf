# this association is already exists when we install the ebs-add on 
# so there's no need for it now

# resource "aws_eks_pod_identity_association" "ebs-csi" {
#   cluster_name    = var.cluster-name
#   namespace       = "kube-system"
#   service_account = kubernetes_service_account.ebs-csi.metadata[0].name
#   role_arn        = var.ebs-csi-driver-arn
# }
