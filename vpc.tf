module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs                 = var.vpc_azs
  private_subnets     = var.vpc_private_subnets
  public_subnets      = var.vpc_public_subnets
  database_subnets    = var.vpc_database_subnets
  enable_nat_gateway  = true
  enable_vpn_gateway  = false
  reuse_nat_ips       = true
  single_nat_gateway  = true
  external_nat_ip_ids = aws_eip.nat.*.id

  tags = merge(var.resource_default_tags, {
    Resource = "VPC"
  })
}




