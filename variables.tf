
variable "gcpproject" {
    type = string
    default = "hc-24a8e492b4d4480484b7b748091"
  
}
variable "awsregion" {
    default = "ap-southeast-2"
    type = string
    description = "sydney, australia"
}

variable "gcpregion" {
    default = "australia-southeast2-a"
    type = string
    description = "sydney, australia"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
  
}

variable "hcp_packer_bucket" {
    default = "burkey-golden-ubuntu"
    type = string
    description = "hcp bucket for iterations"
  
}

variable "hardcoded_cloud_image" {
    default = "packer-1646370185"
    type = string
    description = "hardcoded value for Run Trigger"

  
}