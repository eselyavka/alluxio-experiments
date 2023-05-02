terraform {
  backend "gcs" {
    bucket = "1224acb0ca1a2b1b-tf-state-alluxio-infra"
    prefix = "terraform/state"
  }
}

## BACKEND ##
module "backend" {
  source = "./modules/backend"

  project-id = var.project-id
}

## BUCKETS ##
module "buckets" {
  source = "./modules/buckets"

  project-id = var.project-id
}
