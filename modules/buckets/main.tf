## GCS bucket ##
resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "buckets" {
  count = var.number_of_buckets

  name    = "${random_id.bucket_prefix.hex}-${var.bucket_name}-${count.index}"
  project = var.project-id

  location = "US"

  force_destroy = true

  storage_class = var.storage_class

  public_access_prevention = "enforced"

  versioning {
    enabled = false
  }

}
