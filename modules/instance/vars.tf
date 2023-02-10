
variable "instance_name" {
  type = string
}

variable "instance_image" {
  type = string
}

variable "instance_key_pair" {
  type = string
}

variable "network_name" {
  type = string
  description = "Name of the network that I will create ports/etc"
}

variable "instance_flavour" {
  type = string
  description = "Flavour of the instance"
}

variable "security_group_ids" {
  type = list(string)
  description = "List of security groups id's that will be assigned to the instance"
}

variable "replicas" {
  type = number
  description = "Number of instances to deploy"
  default = 1
}