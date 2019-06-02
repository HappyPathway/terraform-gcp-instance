data "google_compute_image" "image" {
  name = "${var.image_name}"
}

resource "google_compute_address" "static" {
  name = "${random_id.rand.keepers.instance_name}-${random_id.rand.hex}"
}

resource "random_id" "rand" {
  byte_length = 8

  keepers = {
    instance_name = "${var.instance_name}"
  }
}

resource "google_compute_instance" "default" {
  count                     = "${var.instance_count}"
  name                      = "${random_id.rand.keepers.instance_name}-${random_id.rand.hex}"
  machine_type              = "${var.machine_type}"
  zone                      = "${var.zone}"
  allow_stopping_for_update = true
  tags                      = "${var.instance_tags}"

  boot_disk {
    initialize_params {
      image = "${data.google_compute_image.image.self_link}"
      size  = "${var.disk_size}"
    }
  }

  // Local SSD disk
  scratch_disk {}

  network_interface {
    network    = "${var.network_name}"
    subnetwork = "${var.subnetwork_name}"

    access_config {
      nat_ip = "${google_compute_address.static.address}"
    }
  }

  service_account {
    scopes = "${var.service_accounts}"
  }
}
