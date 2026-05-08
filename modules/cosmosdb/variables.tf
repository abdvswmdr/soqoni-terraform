variable "account_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "mongo_server_version" {
  type    = string
  default = "4.2"
}

variable "consistency_level" {
  type    = string
  default = "Session"
}

variable "tags" {
  type    = map(string)
  default = {}
}
