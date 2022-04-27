locals {
  count               = var.subnet_count_private + var.subnet_count_public
  name                = "${replace(var.label, "/[^a-zA-Z0-9_\\-\\.]/", "")}-${var.label}"
  base_security_group = var.base_security_group != null ? var.base_security_group : data.aws_security_group.bassg.id
  ssh_security_group_rule = var.allow_ssh_from != "" ? [{
    name        = "ssh-i"
    type        = "ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allow_ssh_from
    }, {
    name        = "all-e"
    type        = "egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.allow_ssh_from
  }] : []
  security_group_rules = concat(local.ssh_security_group_rule, var.security_group_rules)
}


resource "aws_security_group" "ec2bastion" {
  #  name   = "${var.prefix_name}-bas-sg-group"
  #  vpc_id = data.aws_vpc.vpc.id
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.prefix_name}-bas-sg-group"
  }
}


data "aws_security_group" "bassg" {
  id = aws_security_group.ec2bastion.id
}

resource "aws_security_group_rule" "addSGrule" {

  count             = length(local.security_group_rules)
  security_group_id = local.base_security_group
  type              = local.security_group_rules[count.index]["type"]
  from_port         = lookup(local.security_group_rules[count.index], "from_port", null)
  to_port           = lookup(local.security_group_rules[count.index], "to_port", null)
  protocol          = lookup(local.security_group_rules[count.index], "protocol", null)
  cidr_blocks       = lookup(local.security_group_rules[count.index], "cidr_blocks", null)
  #  ip_version        = lookup(local.security_group_rules[count.index], "ip_version", null)

}


module "bastion1" {
  #  source = "/Users/sivasaivm/Documents/MyData/SivasailamV/Projects/CloudNative/software-everywhere/ec2/ec2-dev-v5/terraform-aws-ec2"
  source = "github.com/cloud-native-toolkit/terraform-aws-ec2"
  #  count  = length(var.subnet_ids_pub) #Single SN approach
  # count         = var.subnet_count_public
  #  subnet_ids_pub          = var.subnet_ids_pub #Single SN approach
  subnets_ids             = var.subnet_ids_pub
  ami_id                  = var.ami_id
  instance_type           = var.instance_type
  pri_instance_monitoring = var.pri_instance_monitoring
  init_script             = var.init_script != "" ? var.init_script : file("${path.module}/scripts/init-jump-server.sh")
  ssh_key                 = var.ssh_key
  publicIP                = var.publicIP
  vpc_id                  = var.vpc_id
}
