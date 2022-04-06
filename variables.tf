variable "hcloud_secret" {
  type        = string
  description = "The token that is used to interact with the Hetzner Cloud API."
}

variable "hcloud_ssh_key_public" {
  type        = string
  description = "ssh public key you want to use register on your Hetzner Cloud machines."
}

variable "hcloud_ssh_key_private" {
  type        = string
  description = "ssh private key you want to use register on your Hetzner Cloud machines."
}

variable "instance_prefix" {
  type        = string
  default     = "rke"
  description = "The prefix that comes before the index-value to form the name of the machine."
}

variable "instance_count" {
  type        = number
  default     = 3
  description = "Number of instances that will be deployed. Should be a odd number (1, 3, 5, etc.)."
}

variable "instance_type" {
  type        = string
  default     = "cx11"
  description = "Hetzner instance type that is used for the machines. You can use the Hetzner Cloud CLI or browse their website to get a list of valid instance types."
}

variable "instance_zones" {
  type        = list(string)
  default     = ["nbg1", "fsn1", "hel1"]
  description = "All zones over which the nodes are distributed."
}

variable "lb_name" {
  type        = string
  default     = "rke-lb"
  description = "Name of the Load Balancer that is placed in front of your instaces."
}

variable "lb_type" {
  type        = string
  default     = "lb11"
  description = "Hetzner Load Balancer type. You can use the Hetzner Cloud CLI or browse their website to get a list of valid instance types."
}

variable "lb_location" {
  type        = string
  default     = "nbg1"
  description = "Location of the Load Balancer."
}

variable "private_network_name" {
  type        = string
  default     = "kubernetes-internal"
  description = "Name of the private network that is created for your nodes. "
}
