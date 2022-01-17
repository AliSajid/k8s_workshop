resource "vultr_block_storage" "k8s_block" {
    size_gb = 50
    region = "ewr"
}
