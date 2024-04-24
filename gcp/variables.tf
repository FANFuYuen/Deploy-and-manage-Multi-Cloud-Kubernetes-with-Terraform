variable "project_id" {
  description = "GCP project_id"
  default     = "fan-itp4121mcloud"
}

variable "credentials_file" {
    default = ["..//key/gcloud_service_account.json"]
 }

variable "region" {
  default     = "asia-east2"
  description = "GCP Region"
}

variable "zone"{
  description = "Zone for infrastructure"
  default = "asia-east2-a"
}

variable "private_cidr_ranges" {
  type          = list(string)
  description   = "Range of private subnetwork."
  default       = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "public_cidr_ranges" {
  type          = list(string)
  description   = "Range of public subnetwork."
  default       = ["10.10.3.0/24", "10.10.4.0/24"]
}
