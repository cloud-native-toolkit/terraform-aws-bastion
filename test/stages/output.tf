output "subnet_ids_pub" {
  depends_on = [module.pub_subnet]
  value = module.pub_subnet.subnet_ids
}

output "instance_public_ip" {
  #  value       = ["${module.ec2.*.public_ip}"]
  #  value       = ["${module.bastion.instance_public_ip}"]
  value       = module.bastion.instance_public_ip
  description = "The public IP address of the instance."
}

