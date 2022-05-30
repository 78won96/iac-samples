terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "foo" {
  bucket = "my-tf-log-bucket"
  acl    = "private"
  versioning {
    enabled = true
  }
  logging {
    target_bucket = "logging_bucket"
    target_prefix = "log/"
  }
  tags = {
    yor_trace = "ee1e6097-3c94-4444-a696-9d4a15270256"
  }
}