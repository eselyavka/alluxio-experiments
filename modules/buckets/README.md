# GCS terraform buckets module

## Purpose

This module will create GCS bucket to store datasets

## Description

This module will create GCS bucket to store datasets

## Usage Instructions

Copy and paste into your Terraform configuration, insert or update the
variables, and run `terraform init`:

```
module bucket {
  source = "./modules/bucket"
  project-id = "foo"
  bucket_name = "bar"
  storage_class = "baz"
}
```

## Preconditions and Assumptions

None

## Inputs

| Name | Description | Type | Default | Required |
| -- | ----------- | ---- | ------- | -------- |
| project-id | Google project-id | string | - | yes |
| bucket_name | Name of the GCS bucket | string | alluxio-storage | no |
| storage_class | Storage class for GCS bucket | string | STANDARD | no |
| number_of_buckets | Number of data GSC buckets to create | number | 3 | no |

## Outputs
| Name | Description | Type | 
| -- | ----------- | ---- |
| storage_bucket_name | Name of the GCS bucket | string |

## Versions
| Version | Major changes  |
| ------- | -------------  |
| 0.1     | Created module |

