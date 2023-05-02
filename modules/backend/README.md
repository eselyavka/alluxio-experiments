# GCS terraform backend module

## Purpose

This module will create GCS bucket to store terraform state

## Description

This module will create GCS bucket to store terraform state

## Usage Instructions

Copy and paste into your Terraform configuration, insert or update the
variables, and run `terraform init`:

```
module backend {
  source = "./modules/backend"
  project-id = "foo"
  tf_backend_bucket_name = "bar"
}
```

## Preconditions and Assumptions

None

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | -------- |
| project-id | Google project-id | string | - | yes |
| tf_backend_bucket_name | Name of the GCS bucket | string | tf-state-alluxio-infra | no |

## Outputs
| Name | Description | Type | 
| ---- | ----------- | ---- | 
| tf-backend-bucket-name | Name of the GCS bucket | string |

## Versions

| Version | Major changes  |
| ------- | -------------  |
| 0.1     | Created module |

