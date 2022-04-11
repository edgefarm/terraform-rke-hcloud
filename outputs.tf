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

output "hcloud_ssh_key_public" {
  description = "registered ssh public key on your Hetzner Cloud machines."
  value       = var.hcloud_ssh_key_public != "" && var.hcloud_ssh_key_private != "" ? var.hcloud_ssh_key_public : tls_private_key.ssh_key_gen[0].public_key_openssh
}

output "hcloud_ssh_key_private" {
  description = "registered ssh private key on your Hetzner Cloud machines."
  value       = var.hcloud_ssh_key_public != "" && var.hcloud_ssh_key_private != "" ? var.hcloud_ssh_key_private : tls_private_key.ssh_key_gen[0].private_key_openssh
}
