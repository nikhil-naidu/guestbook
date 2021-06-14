module "gke" {
  source   = "./gke"
  project  = var.project
}

module "deployment" {
  source   = "./deployment"
  host     = module.gke.host
  client_certificate     = module.gke.client_certificate
  client_key             = module.gke.client_key
  cluster_ca_certificate = module.gke.cluster_ca_certificate
}
