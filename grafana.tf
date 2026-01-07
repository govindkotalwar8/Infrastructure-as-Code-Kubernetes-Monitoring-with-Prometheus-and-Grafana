resource "helm_release" "grafana" {
  name       = "grafana"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"

  values = [
    <<EOF
service:
  type: NodePort
  nodePort: 30001
EOF
  ]

  depends_on = [helm_release.prometheus]
}

