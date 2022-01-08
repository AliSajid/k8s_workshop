resource "vultr_block_storage" "k8s_block" {
    size_gb = 10
    region = "ewr"
}
