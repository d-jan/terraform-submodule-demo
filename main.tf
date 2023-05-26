resource "google_cloud_run_service" "default" {
  project  = var.project
  name     = var.service_name
  location = "asia-northeast1"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/${var.service_name}"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}