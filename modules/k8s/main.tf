# well after moving this pprovider to the root/provider.tf (which is more logical)
# we don't need this file here any more

# provider "kubernetes" {
#   host                   = var.eks-host
#   cluster_ca_certificate = base64decode(var.cluster-certificate)
#   token                  = ephemeral.aws_eks_cluster_auth.cluster-auth.token
# }
#
# ephemeral "aws_eks_cluster_auth" "cluster-auth" {
#   name = var.cluster-name # it only requires the name of the cluster
# }
#
