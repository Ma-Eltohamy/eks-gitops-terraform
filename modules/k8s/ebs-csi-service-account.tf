resource "kubernetes_service_account" "ebs-csi" {
  metadata {
    name      = "ebs-csi-controller-sa"
    namespace = "kube-system"
  }

  lifecycle {
    create_before_destroy = true
  }
}
