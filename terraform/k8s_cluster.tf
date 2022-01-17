resource "vultr_kubernetes" "k8s_workshop" {
  region = "ewr"
  label     = "k8s_workshop"
  version = "v1.21.7+2"

  node_pools {
    node_quantity = 3
    plan = "vc2-2c-4gb"
    label = "workshop"
  }
} 