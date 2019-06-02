local {
  ports = "${var.allow_ssh ? concat(list("22"), var.firewall_ports) : var.firewall_ports}"
}

resource "google_compute_firewall" "firewall" {
  name    = "${random_id.rand.keepers.instance_name}-${random_id.rand.hex}"
  network = "${var.network_name}"

  allow {
    protocol = "tcp"
    ports    = "${local.ports}"
  }

  source_ranges = "${var.source_ranges}"
  target_tags   = "${var.instance_tags}"
}
