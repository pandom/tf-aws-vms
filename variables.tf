
variable "region" {
    default = "ap-southeast-2"
    type = string
    description = "sydney, australia"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
  
}

variable "hcp_packer_bucket" {
    default = "burkey-hcp-packer"
    type = string
    description = "hcp bucket for iterations"
  
}