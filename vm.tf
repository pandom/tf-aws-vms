
data "hcp_packer_iteration" "ubuntu" {
  bucket_name = var.hcp_packer_bucket
  channel     = "development"
}

data "hcp_packer_image" "ubuntu_aws" {
  bucket_name    = var.hcp_packer_bucket
  cloud_provider = "aws"
  iteration_id   = data.hcp_packer_iteration.ubuntu.ulid
  region         = var.awsregion
}
data "hcp_packer_image" "ubuntu_gce" {
  bucket_name    = var.hcp_packer_bucket
  cloud_provider = "gce"
  iteration_id   = data.hcp_packer_iteration.ubuntu.ulid
  region         = var.gcpregion
}

resource "aws_instance" "web" {
  ami           = data.hcp_packer_image.ubuntu_aws.cloud_image_id
  instance_type = "t3.micro"

  tags = {
    Name = "HCP Packer"
  }
}

data "google_service_account" "service_account" {
  account_id = "burkey-test-developer"
}

resource "google_compute_instance" "default" {
  name         = "hcp-test"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
       image = data.hcp_packer_image.ubuntu_gce.cloud_image_id
      #image = var.hardcoded_cloud_image
    }
  }


  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
  service_account {
    email = data.google_service_account.service_account.email
    scopes = ["cloud-platform"]
  }

}