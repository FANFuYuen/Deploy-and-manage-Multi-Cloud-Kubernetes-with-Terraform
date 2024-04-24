# VPC
resource "google_compute_network" "itp4121-vpc-network" {
  name                            = "${var.project_id}-my-network"
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
  delete_default_routes_on_create = false
}

# SUBNETS
resource "google_compute_subnetwork" "private_subnet_1" {
  name                     = "private-subnet-a"
  ip_cidr_range            = var.private_cidr_ranges[0]
  region                   = var.region
  network                  = google_compute_network.itp4121-vpc-network.self_link
  private_ip_google_access = true
  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_subnetwork" "public_subnet_1" {
  name                     = "public-subnet-a"
  ip_cidr_range            = var.public_cidr_ranges[0]
  region                   = var.region
  network                  = google_compute_network.itp4121-vpc-network.self_link
  private_ip_google_access = true
  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_subnetwork" "private_subnet_2" {
  name                     = "private-subnet-b"
  ip_cidr_range            = var.private_cidr_ranges[1]
  region                   = var.region
  network                  = google_compute_network.itp4121-vpc-network.self_link
  private_ip_google_access = true
  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_subnetwork" "public_subnet_2" {
  name                     = "public-subnet-b"
  ip_cidr_range            = var.public_cidr_ranges[1]
  region                   = var.region
  network                  = google_compute_network.itp4121-vpc-network.self_link
  private_ip_google_access = true
  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}