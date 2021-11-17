
data "hcp_packer_iteration" "ubuntu" {
  bucket_name = var.hcp_packer_bucket
  channel     = "development"
}

data "hcp_packer_image" "ubuntu_hcp" {
  bucket_name    = var.hcp_packer_bucket
  cloud_provider = "aws"
  iteration_id   = data.hcp_packer_iteration.ubuntu.id
  region         = var.region
}
resource "aws_instance" "hcp_packer" {
    ami = data.hcp_packer_image.ubuntu_hcp.cloud_image_id
    instance_type = var.instance_type
  
}