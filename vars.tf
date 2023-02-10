
variable "image" {
  default = "cirros-0.5.2-x86_64-disk"
  type    = string
}

variable "flavour" {
  default = "m1.micro"
  type    = string
}

variable "ssh_key" {
  default = "test-key"
  type    = string
}

variable "public_network_id" {
  default = "a3a657c0-3984-40cd-bce9-d4df90ed4b77"
  type    = string
}

variable "public_network_name" {
  default = "public"
  type    = string
}

