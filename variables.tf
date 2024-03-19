variable "region" {
  default     = "sa-east-1"
  description = "Region to deploy the infrastructure"
}

variable "profile" {
  default     = "fiap-env"
  description = "Profile to deploy the infrastructure"
}

variable "app_name" {
  default     = "fiap-producao"
  description = "Application name"
}

variable "mongo_uri" {
  description = "mongo uri"
  sensitive   = true
}
