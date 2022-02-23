output "subnet_ids_pub" {
  depends_on = [module.subnets]
  value      = module.subnets.public_subnet_ids
}

output "instance_public_ip" {
  #  value       = ["${module.ec2.*.public_ip}"]
  #  value       = ["${module.bastion.instance_public_ip}"]
  value       = module.bastion.instance_public_ip
  description = "The public IP address of the instance."
}

