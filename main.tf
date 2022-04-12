terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.33.1"
    }
    rke = {
      source  = "rancher/rke"
      version = "1.3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.3.0"
    }
  }
}
