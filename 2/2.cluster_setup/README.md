## This folder sets up your cluster

### Instructions

# Usage: 
#### Add below code into ../0.account_setup/configurations.tfvars  
```

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
```

4. Set up backend
```
source ../scripts/setenv.sh
```

## Configure tfenv if needed
```
tfenv install 1.1.1
tfenv use 1.1.1
```


5. Run terraform commands
```
terraform init
terraform apply
```