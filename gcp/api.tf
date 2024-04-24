#API

variable "gcp_service_list" {
  description ="The list of apis necessary for the project"
  type = list(string)
  default = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "pubsub.googleapis.com",
    "dns.googleapis.com"
  ]
}

resource "google_project_service" "gcp_services" {
  for_each = toset(var.gcp_service_list)
  project = var.project_id
  service = each.key
  timeouts {
    create = "30m"
    update = "40m"
  }
  disable_dependent_services = true
}
