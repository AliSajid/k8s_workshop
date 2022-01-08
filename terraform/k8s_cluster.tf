module "condor" {
  source                 = "vultr/condor/vultr"
  version                = "2.0.0"
  provisioner_public_key = file(var.ssh_public_key)
  cluster_vultr_api_key  = var.cluster_vultr_api_key
  cluster_name = "workshop"

  control_plane_firewall_rules = [
    {
      port    = 6443
      ip_type = "v4"
      source  = "0.0.0.0/0"
    }
  ]
}