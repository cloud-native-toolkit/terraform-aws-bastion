/*
output "instance_public_ip" {
  #  value       = ["${module.ec2.*.public_ip}"]
  value       = ["${module.bastion1.instance_public_ip}"]
  description = "The public IP address of the instance."
}
*/
/*

output "instance_public_ip" {
  value       = ["${aws_instance.ec2_instance.*.public_ip}"]
  description = "The public IP address of the instance."
}

*/
