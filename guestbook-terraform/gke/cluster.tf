resource "google_container_cluster" "guestbook" {
  name               = "guestbook"
  location           = "northamerica-northeast1"
  initial_node_count = 1
  project         = var.project
  node_locations  = ["northamerica-northeast1-a", "northamerica-northeast1-b", "northamerica-northeast1-c"]
  vertical_pod_autoscaling {
    enabled = "true"
  }
  cluster_autoscaling {
    auto_provisioning_defaults {
      oauth_scopes    = ["https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring"]
      service_account = "default"
    }

    enabled = "true"

    resource_limits {
      maximum       = "1"
      minimum       = "1"
      resource_type = "cpu"
    }

    resource_limits {
      maximum       = "1"
      minimum       = "1"
      resource_type = "memory"
    }
  }
  addons_config {
    horizontal_pod_autoscaling {
      disabled = "false"
    }

    http_load_balancing {
      disabled = "false"
    }

    network_policy_config {
      disabled = "true"
    }
  }
  node_config {
    disk_size_gb    = "100"
    disk_type       = "pd-standard"
    image_type      = "COS_CONTAINERD"
    local_ssd_count = "0"
    machine_type    = "n1-standard-1"
    preemptible     = "false"
    service_account = "965134305713-compute@developer.gserviceaccount.com"
    metadata = {
      disable-legacy-endpoints = "true"
    }
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

output "client_certificate" {
  value     = google_container_cluster.guestbook.master_auth.0.client_certificate
  sensitive = true
}

output "client_key" {
  value     = google_container_cluster.guestbook.master_auth.0.client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = google_container_cluster.guestbook.master_auth.0.cluster_ca_certificate
  sensitive = true
}

output "host" {
  value     = google_container_cluster.guestbook.endpoint
  sensitive = true
}
