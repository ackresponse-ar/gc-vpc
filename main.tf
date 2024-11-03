// Creates a VPC
resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = var.vpc_auto_create_subnets
  mtu                     = var.vpc_mtu
}

// Creates a VPC subnetwork
resource "google_compute_subnetwork" "vpc_network_subnet" {
  name          = var.vpc_subnet_name
  ip_cidr_range = var.vpc_subnet_cidr_range
  region        = var.vpc_subnet_region
  network       = google_compute_network.vpc_network.id
}

// Add ICMP firewall rule
resource "google_compute_firewall" "vpc_firewall_icmp" {
  name    = var.vpc_firewall_icmp_name
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = var.vpc_firewall_icmp_protocol
  }

  source_ranges = var.vpc_firewall_icmp_source_range
}

// Adds a custom firewall rule
resource "google_compute_firewall" "vpc_firewall_custom" {
  name    = var.vpc_firewall_custom_name
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = var.vpc_firewall_custom_protocol
  }

  source_ranges = var.vpc_firewall_custom_source_range
}

// Adds a ssh firewall rule
resource "google_compute_firewall" "vpc_firewall_ssh" {
  name    = var.vpc_firewall_ssh_name
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = var.vpc_firewall_ssh_protocol
    ports    = var.vpc_firewall_ssh_ports
  }

  source_ranges = var.vpc_firewall_ssh_source_range
}

// Adds a rdp firewall rule
resource "google_compute_firewall" "vpc_firewall_rdp" {
  name    = var.vpc_firewall_rdp_name
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = var.vpc_firewall_rdp_protocol
    ports    = var.vpc_firewall_rdp_port
  }

  source_ranges = var.vpc_firewall_rdp_source_range
}