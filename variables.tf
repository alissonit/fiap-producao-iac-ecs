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

# Postgresql
variable "identifier" {
  default     = "db-fiap-producao"
  description = "RDS identifier"
}

variable "db_name" {
  default     = "dbfiapproducao"
  description = "RDS database name"

}

variable "rds_password" {
  description = "RDS password"
  sensitive   = true
}

variable "rds_username" {
  default     = "fiap"
  description = "RDS username"
}

variable "engine" {
  default     = "mysql"
  description = "RDS engine"
}

variable "engine_version" {
  default     = "8.0.33"
  description = "Mysql version"

}

variable "instance_class" {
  default     = "db.m5d.large"
  description = "RDS instance class"
}

variable "allocated_storage" {
  default     = 20
  description = "RDS allocated storage"
}

variable "parameter_group_name" {
  default     = "default.mysql8.0"
  description = "RDS parameter group name"
}

variable "mongo_uri" {
  description = "mongo uri"
  sensitive   = true
}
//variable "ecs_namespace" {
//  description = "ECS Namespace"
//}
