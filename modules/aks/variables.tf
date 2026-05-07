variable "cluster_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "node_count" {
  type = number
}

variable "vm_size" {
  type = string
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for the Linux node pool admin user"
}

variable "tags" {
  type    = map(string)
  default = {}
}
