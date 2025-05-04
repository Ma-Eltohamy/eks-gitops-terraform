# if there's a provider depends on another provider like helm 
# which depends on k8s to execute it's commands

# you have 2 choices either you can give this provider to the helm module explicity
# at the main.tf file which is a the root dir (iti-graduation-project)
#    |
#    |              i will go with this one
# module "helm" {
#   source = "../helm"
#
#   providers = {
#     kubernetes = kubernetes
#   }
#
#   # Other inputs for your helm module
# }

# or by rewriting the other provider (k8s) again inside the helm provider block
# (writing a provider inside another provider)
#    |
#    |
# provider "helm" {
#   kubernetes {
#     host                   = var.eks-host
#     cluster_ca_certificate = base64decode(var.cluster-certificate)
#     token                  = ephemeral.aws_eks_cluster_auth.cluster-auth.token
#   }
# }
