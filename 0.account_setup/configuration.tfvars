google_domain_name = "alemighulamhussain.com"
email              = "alemighulam1981@gmail.com"

BUCKET_NAME        = "terraform-class-alemi81"
PROJECT_NAME       = "terraformproject-class-alemi81"



# This block is used to setup kubernetes
gke_config = {
  region         = "us-central1"
  zone           = "us-central1-c"
  cluster_name   = "project-cluster"
  machine_type   = "e2-medium"
  node_count     = 1
  node_pool_name = "my-node-pool"
  preemptible    = true
  node_version   = "1.23.5-gke.1500" # finds build version automatically based on region. We can change it to 1.21   . In this case it will automatically find minor version
}

# This block is used to setup ingress controller
ingress-controller-config = {
  deployment-name = "ingress-controller-config"
  chart_version            = "4.3.0"
  loadBalancerSourceRanges = "0.0.0.0/0"
}

# This block is used to setup cert-manager
cert-manager-config = {
  deployment-name = "cert-manager-config"
  chart_version = "1.10.0"
}

# This block is used to setup external-dns
external-dns-config = {
  deployment-name = "external-dns-config"
  chart_version            = "6.11.3"
}

# This block is used to setup prometheus
prometheus-config = {
  deployment-name = "prometheus-config"
  chart_version = "15.17.0"
}

# This block is used to setup grafana
grafana-config = {
  deployment-name = "grafana-config"
  chart_version = "6.43.3"
  adminPassword = "password"
  adminUser = "admin"
}

# This block is used to setup kube-state-metrics
kube-state-metrics-config = {
  deployment-name = ""
  chart_version = "4.22.1"
}

vault-config = {
  deployment-name = "vault-config"
  chart_version = "0.22.1"
}

cluster-autoscaler-config = {
  deployment-name = "cluster-autoscaler-config"
  chart_version = "9.21.0"
}



datadog-config = {
  deployment_name = "datadog"
  apiKey          = "4d85506055c712f61641cab53ef3371b"
  site            = "datadoghq.com"
}