# this the required iam role for the control plane to grant for it the required permissions to manage the vpc & also creating load balancers and other staff
resource "aws_iam_role" "eks-control-plane-role" {
  name = "eks-control-plane-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks-control-plane-policy" {
  role       = aws_iam_role.eks-control-plane-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
