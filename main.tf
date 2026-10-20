provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "k8s_sg" {
  name        = var.sg_name
  description = "Allow Kubernetes traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "k8s_node" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = var.node_count
  vpc_security_group_ids = [aws_security_group.k8s_sg.id]

  tags = {
    Name = "${var.node_name_prefix}-${count.index}"
  }
}

output "node_ips" {
  description = "Public IPs of Kubernetes nodes"
  value       = aws_instance.k8s_node[*].public_ip
}
