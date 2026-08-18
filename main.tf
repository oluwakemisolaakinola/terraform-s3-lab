terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "kella_lab_bucket" {
  bucket = "kella-terraform-lab-2026"

  tags = {
    Name        = "Kella Terraform Lab"
    Environment = "Development"
    Project     = "Cloud Learning"
  }
}



output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.kella_lab_bucket.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.kella_lab_bucket.arn
}
