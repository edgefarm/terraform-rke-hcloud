module "cluster_init" {
  source                 = "../"
  hcloud_secret          = "" # INSERT YOUR TOKEN HERE
  hcloud_ssh_key_public  = "" # INSERT YOUR PUBLIC SSH KEY HERE
  hcloud_ssh_key_private = "" # INSERT YOUR PRIVATE SHH KEY HERE
  instance_count         = 2
  instance_prefix        = "rke-cluster"
  instance_type          = "cx31"
  instance_zones         = ["nbg1", "hel1"]
  lb_location            = "nbg1"
  lb_name                = "rke-cluster-lb"
  lb_type                = "lb11"
  private_network_name   = "kubernetes-internal"
}

output "kubeconfig" {
  value       = module.cluster_init.kube_config_yaml
  sensitive   = true
  description = "rke cluster kubeconfig"
}

output "kubernetes_api_server_url" {
  description = "RKE k8s cluster api server url"
  value       = module.cluster_init.kubernetes_api_server_url
}

output "kubernetes_client_cert" {
  description = "RKE k8s cluster client certificate"
  value       = module.cluster_init.kubernetes_client_cert
  sensitive   = true
}

output "kubernetes_client_key" {
  description = "RKE k8s cluster client key"
  value       = module.cluster_init.kubernetes_client_key
  sensitive   = true
}

output "kubernetes_ca_crt" {
  description = "RKE k8s cluster CA certificate"
  value       = module.cluster_init.kubernetes_ca_crt
  sensitive   = true
}


output "lb_address" {
  description = "HCloud loadbalancer address"
  value       = module.cluster_init.lb_address
}
