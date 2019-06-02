variable "image_name" {
  description = "Image Name"
  type        = "string"
}

variable "machine_type" {
  description = "GCP Machine Type"
  type        = "string"
}

variable "zone" {
  description = "GCP Zone"
  default     = "us-west1-a"
  type        = "string"
}

variable "instance_tags" {
  type        = "list"
  description = "Instance tags, will be used for firewall"
}

variable "network_name" {
  description = "Name of GCP Network"
  type        = "string"
}

variable "service_accounts" {
  type        = "list"
  description = "List of GCP Service Accounts, gives permissions to newly created instance"
}

variable "subnetwork_name" {
  type        = "string"
  description = "Name of Subnetwork"
}

variable "disk_size" {
  default     = 1000
  type        = "string"
  description = "Size of Disk"
}

variable "instance_name" {
  type        = "string"
  description = "Name of Instance"
}

variable "instance_count" {
  type        = "string"
  default     = 1
  description = "Number of Instances to Create"
}

variable "firewall_ports" {
  type        = "list"
  description = "Which ports to enable traffic on?"
}

variable "allow_ssh" {
  default     = "false"
  type        = "string"
  description = "Allow Port 22 on Firewall"
}

variable "source_ranges" {
  default     = ["0.0.0.0/0"]
  type        = "list"
  description = "Source Ranges for Firewal Rules"
}
