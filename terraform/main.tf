terraform {
  backend "gcs" {
    # credentials = "/Users/anderson/Documents/dio-dataproc-lab-e1b29a12c8e1.json"
    bucket = "dio-dataproc-lab"
    prefix = "terraform/state"
  }


  # backend "local" {
  #   path = "state/terraform.tfstate"
  # }


  # required_providers {
  #   google = {
  #     source = "hashicorp/google"
  #     # version = "~> 3.38.0"
  #   }
  # }
}

provider "google" {
  # credentials = file("/Users/anderson/Documents/dio-dataproc-lab-e1b29a12c8e1.json")

  project = var.project_id
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {
  # credentials = file("/Users/anderson/Documents/dio-dataproc-lab-e1b29a12c8e1.json")

  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "instances" {
  source = "./modules/instances/"

  machine_type    = var.machine_type
  instances_image = var.instances_image
  network_name    = var.network_name

  project_id = var.project_id
  region     = var.region
  zone       = var.zone
}

module "storage" {
  source = "./modules/storage/"

  project_id = var.project_id
  region     = var.region
  zone       = var.zone
}

# module "terraform-vpc" {
#   source = "terraform-google-modules/network/google"
#   # version = "~> 3.2.2"

#   project_id   = var.project_id
#   network_name = "terraform-vpc"
#   routing_mode = "GLOBAL"

#   subnets = [
#     {
#       subnet_name   = "subnet-01"
#       subnet_ip     = "10.10.10.0/24"
#       subnet_region = var.region
#     },
#     {
#       subnet_name   = "subnet-02"
#       subnet_ip     = "10.10.20.0/24"
#       subnet_region = var.region
#     }
#   ]
# }

# resource "google_compute_firewall" "default" {
#   name    = "tf-firewall"
#   network = var.network_name
#   source_ranges = ["0.0.0.0/0"]

#   allow {
#     protocol = "tcp"
#     ports    = ["80"]
#   }

#   #   allow {
#   #   protocol = "tcp"
#   #   ports    = ["22"]
#   # }
# }