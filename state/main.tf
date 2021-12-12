terraform {
  required_version = "~>1.0.9"  # changed
}

provider "aws" {
  version = "~> 3.7.0"
  region = "eu-central-1" # or any other AW region
}

resource "aws_s3_bucket" "umcs" {  # changed
  bucket = "terraform-umcs-demo"  # changed
  acl    = "private"
  
  # this is only for the demo in order for us
  # to be able to destroy a non-empty bucket
  force_destroy = true

  versioning {
    enabled = true
  }

  # we will desrtoy this bucket in the end, but in 
  # order to avoid destroying it, uncomment the next block:
  # lifecycle {
  #  prevent_destroy = true
  # }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Terraform = "true"
  }
}

resource "aws_s3_bucket_public_access_block" "default" {
  bucket                  = aws_s3_bucket.umcs.id  # changed
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "umcs_lock" {  # changed
  name = "terraform-umcs-demo-lock"  # changed
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S" # Attribute type, which must be a scalar type: (S)tring, (N)umber or (B)inary data
  }

  tags = {
    Terraform = "true"
  }
}
