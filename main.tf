terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    hcp = {
        source = "hashicorp/hcp"
    }
  }
}
provider "hcp" {}

provider "aws" {
  # Configuration options
  # Adds Default Tags
  default_tags {
    tags = {
        owner = "burkey@hashicorp.com"
        name = "burkey"
        ttl = "72"
    }
  }
  region = var.region
}

# data "terraform_remote_state" "tf_aws_core" {
#   backend = "remote"

#   config = {
#     organization = "burkey"
#     workspaces = {
#       name = "tf-aws-core"
#     }
#   }
# }

locals {
#   public_subnets = data.terraform_remote_state.tf_aws_core.outputs.public_subnets
#   vpc_id = data.terraform_remote_state.tf_aws_core.outputs.vpc_id
# 	tags = merge(var.tags, {
#          owner       = "burkey"
# 		 se-region   = "apj"
# 		 purpose     = "customer-demo"
#          ttl         = "48"
# 		 terraform   = true
# 		 hc-internet-facing = true
#    })
}