output "cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "project_id" {
    value = var.project_id
}

output "region" {
    value = var.region
}
