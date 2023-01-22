module "vault" {
  source             = "../modules/monitoring"
  google_domain_name = var.google_domain_name
  PROJECT_NAME       = var.PROJECT_NAME
  service_name       = "vault" #var.vault-config["deployment_name"]
}
module "grafana" {
  source             = "../modules/monitoring"
  google_domain_name = var.google_domain_name
  PROJECT_NAME       = var.PROJECT_NAME
  service_name       = "grafana" #var.grafana-config["deployment_name"]
}
module "prometheus" {
  source             = "../modules/monitoring"
  google_domain_name = var.google_domain_name
  PROJECT_NAME       = var.PROJECT_NAME
  service_name       = "prometheus" #var.prometheus-config["deployment_name"]
}
module "alertmanager" {
  source             = "../modules/monitoring"
  google_domain_name = var.google_domain_name
  PROJECT_NAME       = var.PROJECT_NAME
  service_name       = "alertmanager"
}