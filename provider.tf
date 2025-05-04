provider "aws" {
  region = "us-east-1"
}

provider "kubernetes" {
  host                   = module.eks.eks-host
  cluster_ca_certificate = base64decode(module.eks.cluster-certificate)
  token                  = ephemeral.aws_eks_cluster_auth.cluster-auth.token
}

provider "helm" {
  kubernetes {
    host                   = module.eks.eks-host
    cluster_ca_certificate = base64decode(module.eks.cluster-certificate)
    token                  = ephemeral.aws_eks_cluster_auth.cluster-auth.token
  }
}

ephemeral "aws_eks_cluster_auth" "cluster-auth" {
  name = var.cluster-name # it only requires the name of the cluster
}

# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.34.0"
#     }
#   }

# backend "local" {} # or "s3" for remote state
# }
