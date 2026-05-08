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

variable "dns_service_ip" {
  type    = string
  default = "10.0.0.10"
}

variable "service_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "pod_cidr" {
  type    = string
  default = "10.244.0.0/16"
}

variable "load_balancer_sku" {
  type    = string
  default = "standard"
}
