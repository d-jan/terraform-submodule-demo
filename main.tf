resource "google_cloud_run_service" "default" {
  project  = var.project
  name     = var.service_name
  location = "asia-northeast1"

  template {
    spec {
      containers {
        image = "asia-northeast1-docker.pkg.dev/${var.project}/${var.service_name}"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}