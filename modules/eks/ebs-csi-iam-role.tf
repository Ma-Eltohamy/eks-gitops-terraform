resource "aws_iam_role" "ebs-csi-driver" {
  name = "AmazonEKSEBSCSIDriverRole"

  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Service" : "pods.eks.amazonaws.com"
          },
          "Action" : [
            "sts:AssumeRole",
            "sts:TagSession"
          ]
        }
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "ebs-csi-policy-attach" {
  role = aws_iam_role.ebs-csi-driver.name

  # i just got this policy from the managed amazon policies
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}
