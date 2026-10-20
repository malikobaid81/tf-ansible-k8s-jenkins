variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-0ad21ae1d0696ad58"
}

variable "instance_type" {
  description = "EC2 instance type for Kubernetes nodes"
  type        = string
  default     = "t2.medium"
}

variable "node_count" {
  description = "Number of EC2 nodes to create"
  type        = number
  default     = 2
}

variable "node_name_prefix" {
  description = "Prefix for EC2 node names"
  type        = string
  default     = "k8s-node"
}

variable "sg_name" {
  description = "Name of the security group for Kubernetes"
  type        = string
  default     = "k8s-sg"
}
