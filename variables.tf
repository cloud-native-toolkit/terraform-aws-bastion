###module based variables##start
variable "subnet_id" {
  type    = list(any)
  default = [""]
}

variable "subnet_ids_pub" {
  type    = list(any)
  default = []
}

variable "public_subnet_ids" {
  type    = list(any)
  default = [""]
}

variable "pubnet_ids" {
  type    = list(any)
  default = [""]
}

variable "subnet_ids_pri" {
  type    = list(any)
  default = []
}

variable "subnet_count_private" {
  type    = number
  default = 0
}

variable "subnet_count_public" {
  type    = number
  default = 0
}

variable "ami_id" {
  type        = string
  description = "AMI ID for bastion host"
  default     = ""
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type 2 default"
  default     = "t3.large"
}

variable "publickey" {
  type        = string
  default     = ""
  description = "EC2   Instance Public Key"
}

variable "ssh_key" {
  type    = string
  default = ""
  #  default     = "sivasaivm-pub"
  description = "AWS EC2 Instance Public Key"
}

variable "publicIP" {
  type        = bool
  default     = false
  description = "Whether to attach a public IP to EC2 instance"
}

variable "root_volume_type" {
  type        = string
  description = "Type of root volume. Can be standard, gp2 or io1"
  default     = "gp2"
}

variable "root_block_device_encrypted" {
  type        = bool
  default     = true
  description = "Whether to encrypt the root block device"
}

variable "root_volume_size" {
  type        = number
  description = "Size of the root volume in gigabytes"
  default     = 10
}

variable "tags" {
  type = map(string)
  default = {
    project = "swe"
  }
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

variable "prefix_name" {
  type        = string
  description = "Prefix to be added to the names of resources which are being provisioned"
  default     = "swe"
}

variable "pri_instance_monitoring" {
  type        = bool
  default     = false
  description = "Enable  EC2 private instance advance monitoring"
}

variable "label" {
  default = "prd"
  type    = string
}

variable "allow_ssh_from" {
  type        = list(any)
  description = "An IP address, a CIDR block, or a single security group identifier to allow incoming SSH connection to the virtual server"
  default     = ["0.0.0.0/0"]
}

variable "base_security_group" {
  type        = string
  description = "ID of the base security group(SG) to use for the ec2 instance. If not provided a new SG  will be created."
  default     = null
  #  default = "sg-05637f6e2caa0bef0"
}

variable "security_group_rules" {
  type = list(object({
    name        = string,
    type        = string,
    protocol    = string,
    from_port   = number,
    to_port     = number,
    cidr_blocks = optional(string),
    ip_version  = optional(string),
  }))
  description = "List of security group rules to set on the bastion security group in addition to the SSH rules"
  default     = []
}


###module based variables##end

variable "vpc_id" {
  type    = string
  default = ""
}

variable "vpc_subnet_count" {
  type    = number
  default = 0
}

variable "vpc_subnets" {
  type    = string
  default = ""
}

variable "init_script" {
  type        = string
  default     = ""
  description = "Script to run during the instance initialization. Defaults to an Ubuntu specific script when set to empty"
}

