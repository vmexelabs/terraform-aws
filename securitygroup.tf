
module "web_server_instance_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "Web-Hosting-Inbound-To-Instance-SG"
  description = "Security group for web-server with ports open outside VPC"
  vpc_id      = module.vpc.vpc_id

  egress_rules = []
  ingress_with_cidr_blocks = [
    {
      from_port   = "2087"
      to_port     = "2087"
      protocol    = "tcp"
      description = "CPANEL"
      cidr_blocks = "0.0.0.0/0"
      }, {
      from_port   = "2083"
      to_port     = "2083"
      protocol    = "tcp"
      description = "WHM"
      cidr_blocks = "0.0.0.0/0"
      }, {
      from_port   = "80"
      to_port     = "80"
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
      }, {
      from_port   = "22"
      to_port     = "22"
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = "158.62.18.118/32"
    },
  ]

  tags = merge(var.resource_default_tags, {
    Resource = "Security Group"
  })
}

module "web_server_to_internet_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "Web-Hosting-To-Internet-SG"
  description = "Security group for web-server to access internet"
  vpc_id      = module.vpc.vpc_id
  egress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = merge(var.resource_default_tags, {
    Resource = "Security Group"
  })
}

module "web_server_to_rds_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "Web-Hosting-Instance-To-RDS-SG"
  description = "Security group for web-server to RDS"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "Allow MySQL access from instances"
      cidr_blocks = "10.0.13.0/24"
    }
  ]

  tags = merge(var.resource_default_tags, {
    Resource = "Security Group"
  })
}

