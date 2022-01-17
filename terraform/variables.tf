variable "ssh_public_key" {
  description = "The public key"
}

variable "project_environment" {
  description = "Name of the project Environment."
  default     = "Staging"
}


variable "vultr_api_key" {
  description = "The API Key for Vultr to access resources"
}