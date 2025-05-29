module "rds" {
  source = "terraform-aws-modules/rds/aws"
  # insert the 1 required variable here
  identifier = var.rds_identifier
  # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
  engine               = var.rds_mysql_engine
  engine_version       = var.rds_engine_version
  family               = var.rds_family               # DB parameter group
  major_engine_version = var.rds_major_engine_version # DB option group
  instance_class       = var.rds_instance_class

  allocated_storage     = var.rds_allocated_storage
  max_allocated_storage = var.rds_max_allocated_storage

  db_name  = var.rds_db_name
  username = var.rds_username
  port     = var.rds_port

  multi_az = var.rds_multi_az
  vpc_security_group_ids = [
    module.web_server_to_rds_sg.security_group_id
  ]

  maintenance_window              = var.rds_maintenance_window
  backup_window                   = var.rds_backup_window
  enabled_cloudwatch_logs_exports = var.rds_enabled_cloudwatch_logs_exports
  create_cloudwatch_log_group     = var.rds_create_cloudwatch_log_group

  backup_retention_period = var.rds_backup_retention_period
  skip_final_snapshot     = var.rds_skip_final_snapshot
  deletion_protection     = var.rds_deletion_protection

  performance_insights_enabled          = var.rds_performance_insights_enabled
  performance_insights_retention_period = var.rds_performance_insights_retention_period
  #create_monitoring_role                = var.rds_create_monitoring_role
  #monitoring_role_name                  = var.rds_monitoring_role_name
  #monitoring_interval                   = var.rds_monitoring_interval
  db_subnet_group_name = module.vpc.database_subnet_group
  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  tags = merge(var.resource_default_tags, {
    Resource = "RDS"
  })
  db_instance_tags        = var.resource_default_tags
  db_option_group_tags    = var.resource_default_tags
  db_parameter_group_tags = var.resource_default_tags
  db_subnet_group_tags    = var.resource_default_tags

}
