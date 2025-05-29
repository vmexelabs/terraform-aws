resource "aws_eip" "nat" {
  count  = 1
  domain = "vpc"
}

resource "aws_eip" "ec2" {
  count    = 1
  instance = module.ec2_instance.id
}
