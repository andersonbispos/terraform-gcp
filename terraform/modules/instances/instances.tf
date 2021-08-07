resource "google_compute_instance" "tf-instance-1" {
    name                    = "tf-instance-1"
    machine_type            = var.machine_type
    project                 = var.project_id
    zone                    = var.zone

    metadata_startup_script = <<-EOT
            #!/bin/bash
        EOT

    allow_stopping_for_update = true

    boot_disk {
        initialize_params {
            image  = var.instances_image
        }
    }

    network_interface {
        network = var.network_name
        subnetwork = "subnet-01"

        access_config {
            network_tier = "PREMIUM"
        }
    }

    
}

resource "google_compute_instance" "tf-instance-2" {
    name                    = "tf-instance-2"
    machine_type            = var.machine_type
    project                 = var.project_id
    zone                    = var.zone

        metadata_startup_script = <<-EOT
            #!/bin/bash
        EOT

    allow_stopping_for_update = true

    boot_disk {
        initialize_params {
            image  = var.instances_image
        }
    }

    network_interface {
        network            = var.network_name
        subnetwork = "subnet-02"

        access_config {
            network_tier = "PREMIUM"
        }
    }
}

# resource "google_compute_instance" "tf-instance-3" {
#     name                    = "tf-instance-3"
#     machine_type            = var.machine_type
#     project                 = var.project_id
#     zone                    = var.zone

#         metadata_startup_script = <<-EOT
#             #!/bin/bash
#         EOT

#     allow_stopping_for_update = true

#     boot_disk {
#         initialize_params {
#             image  = var.instances_image
#         }
#     }

#     network_interface {
#         network            = var.network_name
#         # subnetwork = "subnet-02"

#         access_config {
#             network_tier = "PREMIUM"
#         }
#     }
# }