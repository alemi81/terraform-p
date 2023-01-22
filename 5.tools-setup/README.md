### This repo is used to deploy namespaces


# Usage: 
#### Add below code into ../0.account_setup/configurations.tfvars 

```

# This block is used to setup ingress controller
ingress-controller-config = {
  deployment_name = "ingress-controller"
  chart_version            = "4.3.0"
  loadBalancerSourceRanges = "0.0.0.0/0"
}

# This block is used to setup cert-manager
cert-manager-config = {
  deployment_name = "cert-manager"
  chart_version = "1.10.0"
}

# This block is used to setup external-dns
external-dns-config = {
  deployment_name = "external-dns"
  chart_version            = "6.11.3"
}

# This block is used to setup prometheus
prometheus-config = {
  deployment_name = "prometheus"
  chart_version = "15.17.0"
}

# This block is used to setup grafana
grafana-config = {
  deployment_name = "grafana"
  chart_version = "6.43.3"
  adminPassword = "password"
  adminUser = "admin"
}

# This block is used to setup kube-state-metrics
kube-state-metrics-config = {
  deployment_name = "kube-state-metrics"
  chart_version = "4.22.1"
}

vault-config = {
  deployment_name = "vault"
  chart_version = "0.22.1"
}

cluster-autoscaler-config = {
  deployment_name = "cluster-autoscaler"
  chart_version = "9.21.0"
}


datadog-config = {
  deployment_name = "datadog"
  apiKey          = "123"
  site            = "us5.datadoghq.com"
}


```
#### 0. Create a service account with Owner role
#### 1. Configure backend
```
source ../scripts/setenv.sh
```

#### 2. Initialize terraform 
```
terraform  init 
```
#### 3. Create 
```
terraform apply    -var-file ../0.account_setup/configurations.tfvars 
```



# Verification Proccess.


### Prometheus 
```
kubectl get pods -n prometheus 
kubectl get ingress -n prometheus
```

### Grafana 
```
kubectl get pods -n grafana 
kubectl get ingress -n grafana
```

### cert-manager 
```
kubectl get pods -n cert-manager 
```

### metrics-server
```
kubectl get pods -n kube-system
```

### External DNS 
```
kubectl get pods -n default 
On Console >> Cloud DNS >> hosted-zone >> Check records
```



### Check logs of external-dns
```
kubectl get pods -n external-dns 
kubectl logs POD_NAME -n external-dns
```


#### Troubleshooting cert-manager
#### Sometimes when you visit the URL, it complains that certificate is not valid. Run below command and verify it is referring to the right clusterissuer
```
kubectl get Issuers,ClusterIssuers,Certificates,CertificateRequests,Orders,Challenges --all-namespaces
```
#### When above command ran, you should check for certificate readiness, and validity. 