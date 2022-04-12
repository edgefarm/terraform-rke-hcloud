resource "tls_private_key" "ssh_key_gen" {
  algorithm = "ED25519"
}

locals {
  public_key  = var.hcloud_ssh_key_public != "" && var.hcloud_ssh_key_private != "" ? var.hcloud_ssh_key_public : tls_private_key.ssh_key_gen.public_key_openssh
  private_key = var.hcloud_ssh_key_public != "" && var.hcloud_ssh_key_private != "" ? var.hcloud_ssh_key_private : tls_private_key.ssh_key_gen.private_key_openssh
}
