output "self_link" {
  value = "${google_compute_instance.default.self_link}"
}

output "ip_address" {
  value = "${google_compute_address.static.address}"
}
