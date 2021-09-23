output "kubernetes_api_server_url" {
  description = "RKE k8s cluster api server url"
  value       = rke_cluster.rke_cluster.api_server_url
}

output "kubernetes_client_cert" {
  description = "RKE k8s cluster client certificate"
  value       = rke_cluster.rke_cluster.client_cert
  sensitive   = true
}

output "kubernetes_client_key" {
  description = "RKE k8s cluster client key"
  value       = rke_cluster.rke_cluster.client_key
  sensitive   = true
}

output "kubernetes_ca_crt" {
  description = "RKE k8s cluster CA certificate"
  value       = rke_cluster.rke_cluster.ca_crt
  sensitive   = true
}

output "kube_config_yaml" {
  description = "RKE k8s cluster kube config yaml"
  value       = rke_cluster.rke_cluster.kube_config_yaml
  sensitive   = true
}

output "lb_address" {
  description = "HCloud loadbalancer address"
  value       = hcloud_load_balancer.rke_lb.ipv4
}
