resource "helm_release" "jenkins" {
  name             = "jenkins"
  namespace        = "jenkins"
  create_namespace = true

  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = "5.8.37"

  values = [
    file("${path.module}/jenkins-values.yml")
  ]
}
