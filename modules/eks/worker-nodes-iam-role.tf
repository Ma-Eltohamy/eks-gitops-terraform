resource "aws_iam_role" "eks-worker-role" {
  name = "eks-worker-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks-worker_node-policies" {
  role       = aws_iam_role.eks-worker-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

# i don't need why would i need to only read the ecr-repo not pulling only reading
# that's why i don't think that i would need it any more
# The AmazonEC2ContainerRegistryReadOnly policy is necessary because EKS worker nodes need to pull container images from Amazon ECR (Elastic Container Registry), especially for:
#     Core system components (like the VPC CNI plugin, CoreDNS, kube-proxy)
#     Add-ons (like the EBS CSI driver)
#     Your own application images — if you build and push them to ECR

resource "aws_iam_role_policy_attachment" "eks-worker-ec2-policies" {
  role       = aws_iam_role.eks-worker-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "eks-worker-auto-scaling-policies" {
  role       = aws_iam_role.eks-worker-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

# this one is nessecary for the eks to have an container network interface 
resource "aws_iam_role_policy_attachment" "amazon_eks_cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks-worker-role.name
}

# each amazon eks policy starts with AmazonEKS
# we don't need to attach the ebs-csi driver policy to the nodes (if we trying to apply the IRSA mechanisim so we need to attach the created ebs-cis ploicy role to the SA)
# SA --> service account (which is inside the cluster) 
# resource "aws_iam_role_policy_attachment" "eks-worker-ebs-policy" {
#   role       = aws_iam_role.eks-worker-role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_EBS_CSI_Driver_Policy"
# }
