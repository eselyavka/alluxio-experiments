## VARS ##
variable "project-id" {
  type = string
}

variable "bucket_name" {
  type    = string
  default = "alluxio-storage"
}

variable "storage_class" {
  type    = string
  default = "STANDARD"
}

variable "number_of_buckets" {
  type    = number
  default = 3
}
