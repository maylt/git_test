variable credentials {}

provider "google" {
    credentials = "${var.credentials}"
    project     = "${var.project}"
    region      = "us-west1"
}

resource "random_id" "instance_id" {
    byte_length = 8
}

resource "google_compute_instance" "default" {
    name            = "em-${random_id.instance_id.hex}"
    machine_type    = "f1-micro"
    zone            = "us-west1-a"

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
        }
    }

    metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

    network_interface {
        network = "default"

        access_config {
        }
    }

}