terraform {
  backend "s3" {
    bucket         = "terraform-tfstate-demo"
    dynamodb_table = "terraform-tfstate-demo-lock"
    key            = "terraform.tfstate" # the key inside the bucket
    region         = "eu-central-1"
    encrypt        = true
  }
}
