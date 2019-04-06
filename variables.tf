variable "gcp_project" {
  description = "GCP project name"
  default  = "gke-dev-231820"
}

variable "gcp_region" {
  description = "GCP region, e.g. northamerica-northeast1 for Montreal"
  default = "northamerica-northeast1"
}

variable "gcp_zone" {
  description = "GCP zone, e.g. northamerica-northeast1-a (which must be in gcp_region)"
  default = "northamerica-northeast1-a"
}

# variable "gcp_other_zone" {
#   description = "GCP list of other zone, e.g. northamerica-northeast1-b, northamerica-northeast1-c"
#   default = ["northamerica-northeast1-b", "northamerica-northeast1-c"]
# }

variable "cluster_name" {
  description = "Name of the K8s cluster"
  default = "gke-dev"
}

variable "initial_node_count" {
  description = "Number of worker VMs to initially create"
  default = 1
}

variable "worker_version" {
  default = "1.12.6-gke.10"
}

variable "master_version" {
  default = "1.12.6-gke.10"
}

variable "master_username" {
  description = "Username for accessing the Kubernetes master endpoint"
  default = "r00t"
}

variable "master_password" {
  description = "Password for accessing the Kubernetes master endpoint"
  default = "qwerty*1234567890"
}

variable "node_machine_type" {
  description = "GCE machine type"
  default = "n1-standard-1"
}

variable "node_disk_size" {
  description = "Node disk size in GB"
  default = "50"
}

variable "min_node_count" {
  default = "Minimum node"
  default = "1"
}

variable "max_node_count" {
  default = "Maximum node"
  default = "1"
}
