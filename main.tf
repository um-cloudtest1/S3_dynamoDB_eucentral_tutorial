terraform {
  required_version = "~>1.0.9"  # changed
}

provider "aws" {
  version = "~> 3.7.0"
  region  = "eu-central-1"
}

resource "aws_instance" "this" {
  ami           = "ami-052eaddc8881bf2ec" # ubuntu 20.04 (http://cloud-images.ubuntu.com/locator/ec2/)
  instance_type = var.instance_type

  tags = {
    Terraform = "true"
    Name      = "test-instance"
  }
}
