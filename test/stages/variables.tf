variable "region" {
  type        = string
  default     = ""
  description = "Please set the region where the resouces to be created "
}

variable "subnet_id" {
  type    = list(any)
  default = [""]
}

variable "public_subnet_ids" {
  type    = list(any)
  default = [""]
}

variable "pubnet_ids" {
  type    = list(any)
  default = [""]
}

variable "resource_group_name" {
  type    = string
  default = "default"
}



###module based variables##

variable "base_security_group" {
  type        = string
  description = "ID of the base security group(SG) to use for the ec2 instance. If not provided a new SG  will be created."
  default     = null
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

variable "subnet_ids_pub" {
  type    = list(any)
  default = []
}

variable "subnet_count_public" {
  type        = number
  description = "Number of vpc subnets"
  default     = 0
}

variable "subnet_count_private" {
  type        = number
  description = "Number of vpc subnets"
  default     = 0
}

variable "pri_instance_monitoring" {
  type        = bool
  default     = false
  description = "Enable  EC2 private instance advance monitoring"
}

variable "allow_ssh_from" {
  type        = list(any)
  description = "An IP address, a CIDR block, or a single security group identifier to allow incoming SSH connection to the virtual server"
  default     = ["0.0.0.0/0"]
}

#####



### var used by SSH Module ####start

variable "private_key_file" {
  type    = string
  default = ""
}

variable "private_key" {
  type    = string
  default = ""
}

variable "public_key_file" {
  type    = string
  default = ""
}

variable "public_key" {
  type    = string
  default = ""
}

variable "rsa_bits" {
  type    = number
  default = 3072
}

variable "name" {
  type    = string
  default = ""
}

variable "label" {
  default = "prd"
  type    = string
}

variable "name_prefix" {
  type        = string
  default     = "swe"
  description = "name prefix"
}


###var used by SSH Module ###end

###var used by VPC Module ###start

variable "provision" {
  type        = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default     = true
}

variable "internal_cidr" {
  type        = string
  description = "The cidr range of the internal network.Either provide manually or chose from AWS IPAM poolsß"
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  type        = string
  description = "Instance is shared / dedicated, etc. #[default, dedicated, host]"
  default     = "default"
}

#used by VPC,Subnet & EC2 Module #
variable "vpc_id" {
  type        = string
  description = "The id of the existing VPC instance"
  default     = ""
}


###var used by VPC Module ###end

###var used by Subenet Module ###start


variable "private_subnet_cidr" {
  type        = list(string)
  description = "(Required) The CIDR block for the private subnet."
  default     = ["10.0.125.0/24"]
}

variable "public_subnet_cidr" {
  type        = list(string)
  description = "(Required) The CIDR block for the public subnet."
  default     = ["10.0.0.0/20"]
}

variable "availability_zones" {
  description = "List of availability zone ids"
  type        = list(string)
  default     = [""]
}

variable "tags" {
  type = map(string)
  default = {
    project = "swe"
  }
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

variable "public_subnet_tags" {
  description = "Tags for public subnets"
  type        = map(string)
  default = {
    tier = "public"
  }
}

variable "private_subnet_tags" {
  description = "Tags for private subnets"
  type        = map(string)
  default = {
    tier = "private"
  }
}


###var used by Subenet Module ###end

###var used by EC2 module ###start

variable "subnet_ids_pri" {
  type    = list(any)
  default = []
}

variable "ami_id" {
  type        = string
  description = "AMI ID for bastion host"
  default     = "ami-03fa4afc89e4a8a09"
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


variable "root_volume_type" {
  type        = string
  description = "Type of root volume. Can be standard, gp2 or io1"
  default     = "gp2"
}

variable "publicIP" {
  type        = bool
  default     = true
  description = "Whether to attach a public IP to EC2 instance"
}

variable "ssh_key" {
  type        = string
  default     = ""
  description = "AWS EC2 Instance Public Key"
}


###var used by EC2 module ###end


variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}

/*
variable "vpc_subnet_count" {
  type        = number
  description = "Number of vpc subnets"
}

variable "vpc_subnets" {
  type        = list(object({
    label = string
    id    = string
    zone  = string
  }))
  description = "List of subnets with labels"
}

*/
###var Used by SSH,VPC, module  ###start


###var Used by SSH, module###end


#From ec2insatnce script
variable "aws_region" {
  type        = string
  default     = "us-west-1"
  description = "AWS Region to provision EC2 instance"
}

variable "vpc_cidr" {
  default = "10.20.0.0/16"
}

variable "subnet_cidr" {
  type    = list(any)
  default = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "cidr_blocks" {
  type        = list(any)
  default     = ["0.0.0.0/0"]
  description = "SG CIDR"
}


######Other options which can be used###



variable "security_groups" {
  description = "A list of Security Group IDs to associate with EC2 instance."
  type        = list(string)
  default     = []
}

