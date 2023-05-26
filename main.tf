resource "google_cloud_run_service" "default" {
  project  = var.project
  name     = var.service_name
  location = "asia-northeast1"

  template {
    spec {
      containers {
        image = "asia-northeast1-docker.pkg.dev/cainz-searchrd-dev/prototype-frontend/prototype-webserver:latest"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}