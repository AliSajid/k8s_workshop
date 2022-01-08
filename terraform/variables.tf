variable "instance_ami_id" {
  description = "AMI ID to use for the instance"
  default     = "ami-08ca853ab4051bce7"
}

variable "ssh_user" {
  description = "SSH User name"
  default     = "ec2-user"
}

variable "ssh_public_key" {
  description = "The public key"
  default     = "/Users/asimami/.ssh/asimami-cdrl-useast2-terraform.pub"
}

variable "rstudio_instance_type" {
  description = "Instance type for the instance running RStudio Server"
  default     = "m5a.large"
}

variable "bastion_instance_type" {
  description = "Instance type for the instance running the Bastion Host"
  default     = "t3a.micro"
}

variable "shiny_instance_type" {
  description = "Instance type for the instance running the Shiny Server"
  default     = "m5a.large"
}

variable "idp_instance_type" {
  description = "Instance type for the instance running the IDP Server"
  default     = "t3a.medium"
}


variable "project_environment" {
  description = "Name of the project Environment."
  default     = "Staging"
}

variable "workspace" {
  description = "Workspace to use for the provider in Terraform Cloud"
  default     = "Project-Nimbus-staging"
}

variable "cluster_vultr_api_key" {
}