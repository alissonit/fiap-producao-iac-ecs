terraform {
  backend "s3" {
    bucket  = "01-sandbox-state-tf"
    key     = "rds/terraform.tfstate"
    region  = "sa-east-1"
    profile = "fiap-env"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
