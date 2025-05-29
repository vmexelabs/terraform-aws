variable "resource_default_tags" {
  description = "Tag Terraform Resources"
  type        = map(string)
  default = {
    managedBy   = "MSP-Name"
    environment = "Web-Hosting"
    project     = "3-Tier-AWS-Migration"
    createdBy   = "Terraform"
  }
}

variable "default_region" {
  default = "ap-southeast-2"
}

variable "Project_Name" {
  default = {
    name = "Web-Hosting"
  }
}


####################
########## EC2 Instance
####################


variable "ec2_name" {
  description = "Name of the EC2 Instance"
  type        = string
  default     = "Web-Hosting"
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  type    = string
  default = "web-hosting-key"
}

variable "ami" {
  type    = string
  default = "ami-083d7e807a89b0837"
}

variable "eni_details" {
  type    = string
  default = "eni-0d739b07646e07b03"
}

####################
########## VPC
####################

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "Web-Hosting-VPC"
}

variable "vpc_public_subnets" {
  description = "List of public subnet CIDR ranges"
  type        = list(string)
  #default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  default = ["10.0.13.0/24"]
}

variable "vpc_database_subnets" {
  description = "List of database subnet CIDR ranges"
  type        = list(string)
  #default     = ["10.0.107.0/24", "10.0.108.0/24", "10.0.109.0/24"]
  default = ["10.0.12.0/24", "10.0.15.0/24"]
}

variable "vpc_private_subnets" {
  description = "List of private subnet CIDR ranges"
  type        = list(string)
  #default     = ["10.0.104.0/24", "10.0.105.0/24", "10.0.106.0/24"]
  default = ["10.0.14.0/24"]
}

variable "vpc_cidr" {
  description = "VPC CIDR range"
  type        = string
  default     = "10.0.0.0/20"
}

variable "vpc_azs" {
  description = "List of AZs"
  type        = list(string)
  #default     = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  default = ["ap-southeast-2a", "ap-southeast-2b"]
}

####################
########## RDS
####################

variable "rds_sg_name" {
  description = "Relational database service security group name"
  type        = string
  default     = "Web-Hosting-RDS"
}

variable "rds_sg_description" {
  description = "Relational database service security group description"
  type        = string
  default     = "Web-Hosting-RDS-SG"
}

variable "rds_identifier" {
  description = "Relational database service identifier"
  type        = string
  default     = "swim-web-hosting-rds"
}

variable "rds_mysql_engine" {
  description = "Relational database service mysql engine"
  type        = string
  default     = "mysql"
}

variable "rds_engine_version" {
  description = "Relational database service mysql engine version"
  type        = string
  default     = "8.0.39"
}

variable "rds_family" {
  description = "Relational database service family"
  type        = string
  default     = "mysql8.0"
}

variable "rds_major_engine_version" {
  description = "Relational database service major engine version"
  type        = string
  default     = "8.0"
}

variable "rds_instance_class" {
  description = "Relational database service instance class"
  type        = string
  default     = "db.t4g.micro"
}

variable "rds_allocated_storage" {
  description = "Relational database service allocated storage"
  type        = number
  default     = 10
}

variable "rds_max_allocated_storage" {
  description = "Relational database service max allocated storage"
  type        = number
  default     = 20
}

variable "rds_db_name" {
  description = "Relational database service db name"
  type        = string
  default     = "web_hosting_database"
}

variable "rds_username" {
  description = "Relational database service username"
  type        = string
  default     = "db_web_user"
}

variable "rds_port" {
  description = "Relational database service port"
  type        = number
  default     = 3306
}

variable "rds_multi_az" {
  description = "Relational database service multi az"
  type        = bool
  default     = false
}

variable "rds_maintenance_window" {
  description = "Relational database service maintenance window"
  type        = string
  default     = "Mon:00:00-Mon:03:00"
}

variable "rds_backup_window" {
  description = "Relational database service backup window"
  type        = string
  default     = "03:00-06:00"
}

variable "rds_enabled_cloudwatch_logs_exports" {
  description = "Relational database service enabled cloudwatch log exports"
  type        = list(any)
  default     = ["general"]
}

variable "rds_create_cloudwatch_log_group" {
  description = "Relational database service create cloudwatch log group"
  type        = bool
  default     = true
}

variable "rds_backup_retention_period" {
  description = "Relational database service backup retention period"
  type        = number
  default     = 0
}

variable "rds_skip_final_snapshot" {
  description = "Relational database service skip final snapshot"
  type        = bool
  default     = true
}

variable "rds_deletion_protection" {
  description = "Relational database service deletion protection"
  type        = bool
  default     = false
}

variable "rds_performance_insights_enabled" {
  description = "Relational database service insights enabled"
  type        = bool
  default     = false
}

variable "rds_performance_insights_retention_period" {
  description = "Relational database service retention period"
  type        = number
  default     = 7
}

variable "rds_create_monitoring_role" {
  description = "Relational database service create monitoring role"
  type        = bool
  default     = false
}

variable "rds_monitoring_role_name" {
  description = "Relational database service create monitoring role"
  type        = string
  default     = "rds-monitoring-role"
}

variable "rds_monitoring_interval" {
  description = "Relational database service monitoring interval"
  type        = number
  default     = 60
}
