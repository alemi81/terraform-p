module "datadog-terraform-k8s-namespace" {
  source = "../modules/terraform-k8s-namespace/"
  name   = "datadog"
}

module "datadog-terraform-helm" {
  source               = "../modules/terraform-helm-local/"
  deployment_name      = var.datadog-config["deployment_name"]
  deployment_namespace = "datadog"
  deployment_path      = "charts/datadog"
  values_yaml          = <<EOF
datadog:
  clusterName: "${var.gke_config["cluster_name"]}"
  site: "${var.datadog-config["site"]}"
  apiKey: "${var.datadog-config["apiKey"]}"
  logs:
    enabled: true
    containerCollectAll: true
EOF
}

