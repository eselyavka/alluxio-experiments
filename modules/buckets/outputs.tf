## OUTPUTS ##
output "storage_bucket_name" {
  value = google_storage_bucket.buckets.*.name
}
