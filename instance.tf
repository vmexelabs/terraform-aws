module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = var.ec2_name

  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  monitoring    = true

  network_interface = [
    {
      network_interface_id = var.eni_details
      device_index         = 0
    }
  ]

  #vpc_security_group_ids = [
  #  module.web_server_to_internet_sg.security_group_id,
  #  module.web_server_instance_sg.security_group_id,
  #  module.web_server_to_rds_sg.security_group_id
  #]
  #subnet_id                   = flatten("${module.vpc.public_subnets}")[0]
  #associate_public_ip_address = true

  user_data = <<EOF
#!/bin/bash
apt install screen net-tools network-manager -y
sudo apt update && apt upgrade -y
cd /home/ssm-user
EOF

  tags = merge(var.resource_default_tags, {
    Resource = "EC2"
  })
}
