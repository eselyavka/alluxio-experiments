## OUTPUTS ##
output "tf-backend-bucket-name" {
  value = module.backend.tf-backend-bucket-name
}

output "alluxio-storage-bucket-name" {
  value = module.buckets.storage_bucket_name
}