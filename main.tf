# Script terraform pour mettre en place un cluster Google Kubernetes Engine (GKE) sur Google Cloud Platform (GCP)
terraform {
  required_version = ">= 0.11.0"
}

# Definition de la methode de login
provider "google" {
  credentials = "${file("./credentials/gke-dev-9e10e2ee5fbf.json")}"
  project     = "${var.gcp_project}"
  region      = "${var.gcp_region}"
}

# Setup and bootstrap GKE cluster
resource "google_container_cluster" "gke-dev" {
  name               = "${var.cluster_name}"
  description        = "GKE cluster Dev"
  zone               = "${var.gcp_zone}"
  additional_zones   = "${var.gcp_other_zone}"
  initial_node_count = "${var.initial_node_count}"
  enable_kubernetes_alpha = "true"
  enable_legacy_abac = "true"
  min_master_version = "${var.master_version}"
  node_version       = "${var.worker_version}"

  master_auth {
    username = "${var.master_username}"
    password = "${var.master_password}"
  }

  node_config {
    machine_type = "${var.node_machine_type}"
    disk_size_gb = "${var.node_disk_size}"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }

  # autoscaling {
  #   min_node_count = "${var.min_node_count}"
  #   max_node_count = "${var.max_node_count}"
  # }
}

# Get cluster credentials
provider "kubernetes" {
  host = "https://${google_container_cluster.gke-dev.endpoint}"
  username = "${google_container_cluster.gke-dev.master_auth.0.username}"
  password = "${google_container_cluster.gke-dev.master_auth.0.password}"
  client_certificate = "${base64decode(google_container_cluster.gke-dev.master_auth.0.client_certificate)}"
  client_key = "${base64decode(google_container_cluster.gke-dev.master_auth.0.client_key)}"
  cluster_ca_certificate = "${base64decode(google_container_cluster.gke-dev.master_auth.0.cluster_ca_certificate)}"

}
