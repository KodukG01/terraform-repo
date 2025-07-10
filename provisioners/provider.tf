terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }
}
terraform {
  backend "s3" {
    bucket = "84s-tf-demo-state"
    key    = "provisioner-state-mode"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
   
  }
}


provider "aws" {
  # Configuration options
}