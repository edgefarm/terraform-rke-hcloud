# terraform-rke-hcloud

terraform module to setup rke(ha) on hetzner hcloud.

This project is highly inspired by [alexzimmer96/rancher-hcloud](https://github.com/alexzimmer96/rancher-hcloud),
but separates the setup of the rke cluster from the helm based rancher setup,
because of flexibility and k8s best practices.

The rancher-hcloud terraform module can be found
[here](https://github.com/edgefarm/terraform-rancher-hcloud).

## example

Go to example folder, adjust main.tf and run:

```bash
terraform init
terraform apply
```

After the commands have been executed (takes a few minutes), there should be
a `kubeconfig.yaml` in the local directory, which can be used to access the
cluster.

Test your cluster:

```bash
export KUBECONFIG=$(realpath ./kubeconfig.yaml)
kubectl get po --all-namespaces
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | 1.31.0 |
| <a name="requirement_rke"></a> [rke](#requirement\_rke) | 1.2.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.31.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.1.0 |
| <a name="provider_rke"></a> [rke](#provider\_rke) | 1.2.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_load_balancer.rke_lb](https://registry.terraform.io/providers/hetznercloud/hcloud/1.31.0/docs/resources/load_balancer) | resource |
| [hcloud_load_balancer_network.rke_lb_network_registration](https://registry.terraform.io/providers/hetznercloud/hcloud/1.31.0/docs/resources/load_balancer_network) | resource |
| [hcloud_load_balancer_service.rke_lb_http_service](https://registry.terraform.io/providers/hetznercloud/hcloud/1.31.0/docs/resources/load_balancer_service) | resource |
| [hcloud_load_balancer_service.rke_lb_https_service](https://registry.terraform.io/providers/hetznercloud/hcloud/1.31.0/docs/resources/load_balancer_service) | resource |
| [hcloud_load_balancer_service.rke_lb_k8s_service](https://registry.terraform.io/providers/hetznercloud/hcloud/1.31.0/docs/resources/load_balancer_service) | resource |
| [hcloud_load_balancer_target.rke_lb_targets](https://registry.terraform.io/providers/hetznercloud/hcloud/1.31.0/docs/resources/load_balancer_target) | resource |
| [hcloud_network.kubernetes_internal_network](https://registry.terraform.io/providers/hetznercloud/hcloud/1.31.0/docs/resources/network) | resource |
| [hcloud_network_subnet.rke_subnet](https://registry.terraform.io/providers/hetznercloud/hcloud/1.31.0/docs/resources/network_subnet) | resource |
| [hcloud_server.rke_nodes](https://registry.terraform.io/providers/hetznercloud/hcloud/1.31.0/docs/resources/server) | resource |
| [hcloud_server_network.rancher_node_subnet_registration](https://registry.terraform.io/providers/hetznercloud/hcloud/1.31.0/docs/resources/server_network) | resource |
| [hcloud_ssh_key.rke_ssh_key](https://registry.terraform.io/providers/hetznercloud/hcloud/1.31.0/docs/resources/ssh_key) | resource |
| [local_file.kube_config_server_yaml](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [rke_cluster.rke_cluster](https://registry.terraform.io/providers/rancher/rke/1.2.3/docs/resources/cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hcloud_secret"></a> [hcloud\_secret](#input\_hcloud\_secret) | The token that is used to interact with the Hetzner Cloud API. | `string` | n/a | yes |
| <a name="input_hcloud_ssh_key_private"></a> [hcloud\_ssh\_key\_private](#input\_hcloud\_ssh\_key\_private) | ssh private key you want to use register on your Hetzner Cloud machines. | `string` | n/a | yes |
| <a name="input_hcloud_ssh_key_public"></a> [hcloud\_ssh\_key\_public](#input\_hcloud\_ssh\_key\_public) | ssh public key you want to use register on your Hetzner Cloud machines. | `string` | n/a | yes |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of instances that will be deployed. Should be a odd number (1, 3, 5, etc.). | `number` | `3` | no |
| <a name="input_instance_prefix"></a> [instance\_prefix](#input\_instance\_prefix) | The prefix that comes before the index-value to form the name of the machine. | `string` | `"rke"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Hetzner instance type that is used for the machines. You can use the Hetzner Cloud CLI or browse their website to get a list of valid instance types. | `string` | `"cx11"` | no |
| <a name="input_instance_zones"></a> [instance\_zones](#input\_instance\_zones) | All zones over which the nodes are distributed. | `list(string)` | <pre>[<br>  "nbg1",<br>  "fsn1",<br>  "hel1"<br>]</pre> | no |
| <a name="input_lb_location"></a> [lb\_location](#input\_lb\_location) | Location of the Load Balancer. | `string` | `"nbg1"` | no |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | Name of the Load Balancer that is placed in front of your instaces. | `string` | `"rke-lb"` | no |
| <a name="input_lb_type"></a> [lb\_type](#input\_lb\_type) | Hetzner Load Balancer type. You can use the Hetzner Cloud CLI or browse their website to get a list of valid instance types. | `string` | `"lb11"` | no |
| <a name="input_private_network_name"></a> [private\_network\_name](#input\_private\_network\_name) | Name of the private network that is created for your nodes. | `string` | `"kubernetes-internal"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kube_config_yaml"></a> [kube\_config\_yaml](#output\_kube\_config\_yaml) | RKE k8s cluster kube config yaml |
| <a name="output_kubernetes_api_server_url"></a> [kubernetes\_api\_server\_url](#output\_kubernetes\_api\_server\_url) | RKE k8s cluster api server url |
| <a name="output_kubernetes_ca_crt"></a> [kubernetes\_ca\_crt](#output\_kubernetes\_ca\_crt) | RKE k8s cluster CA certificate |
| <a name="output_kubernetes_client_cert"></a> [kubernetes\_client\_cert](#output\_kubernetes\_client\_cert) | RKE k8s cluster client certificate |
| <a name="output_kubernetes_client_key"></a> [kubernetes\_client\_key](#output\_kubernetes\_client\_key) | RKE k8s cluster client key |
| <a name="output_lb_address"></a> [lb\_address](#output\_lb\_address) | HCloud loadbalancer address |
