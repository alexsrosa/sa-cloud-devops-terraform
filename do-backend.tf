###############################
# Store the state file using a DO Spaces bucket
###############################
terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoint                    = "fra1.digitaloceanspaces.com"
    region                      = "us-east-1" # leave this as is (Terraform expects the AWS format - N/A for DO Spaces)
    bucket                      = "sa-terraform-backend-bucket"
  }
}
