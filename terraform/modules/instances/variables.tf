variable "project_id" {
  description = "The project ID to host the network in"
  default     = "dio-dataproc-lab"
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "machine_type" {
   type = string
}

variable "instances_image" {
   type = string
}

variable "network_name" {
   type = string
}