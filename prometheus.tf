resource "helm_release" "prometheus" {
  name       = "prometheus"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"

  values = [
    <<EOF
server:
  service:
    type: NodePort
    nodePort: 30000
EOF
  ]

  depends_on = [kubernetes_namespace.monitoring]
}
