resource "rke_cluster" "rke_cluster" {
  cluster_name       = "rke"
  kubernetes_version = "v1.22.4-rancher1-1"

  dynamic "nodes" {
    for_each = hcloud_server.rke_nodes
    content {
      address          = nodes.value.ipv4_address
      internal_address = hcloud_server_network.rancher_node_subnet_registration[nodes.key].ip
      role             = ["controlplane", "worker", "etcd"]
      user             = "root"
      ssh_agent_auth   = true
      ssh_key          = local.private_key
    }
  }

  upgrade_strategy {
    drain                  = true
    max_unavailable_worker = "20%"
  }

  authentication {
    sans = [
      hcloud_load_balancer.rke_lb.ipv4
    ]
  }

}

resource "local_file" "kube_config_server_yaml" {
  filename = "./kubeconfig.yaml"
  content  = rke_cluster.rke_cluster.kube_config_yaml
}
