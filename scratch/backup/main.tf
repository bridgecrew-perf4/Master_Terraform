terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = "us-west-2"
}

resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "jjl-s3-bucket-devops-pro"
  versioning {
    enabled = true
  }
}

resource "aws_iam_user" "my_iam_user" {
  name = "my_iam_user_abc"
}
