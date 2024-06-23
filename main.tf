# Provider Configuration
provider "aws" {
  region                   = "ap-south-1" # Mumbai region
  shared_credentials_files = ["/root/.aws/credentials"]

}

# Security Group
resource "aws_security_group" "project_sg" {
  name        = "project_sg"
  description = "Allow SSH, HTTP, and HTTP on port 8080"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP on port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "project_instance" {
  ami           = "ami-05e00961530ae1b55" # Ubuntu 22.04 LTS AMI ID in ap-south-1 (Mumbai)
  instance_type = "t2.micro"
  key_name      = "project-pk" # Use the existing PEM key

  vpc_security_group_ids = [aws_security_group.project_sg.id]

  tags = {
    Name = "project-instance"
  }
}

# Backend Configuration for Terraform State
//terraform {
  //backend "s3" {
    //bucket = "terraform-state-anurag" # Replace with your S3 bucket name
    //key    = "terraform.tfstate"     # State file name in S3 bucket
    //region = "ap-south-1"            # S3 bucket region
  //}
//}

terraform {
  cloud {
    organization = "Terraform-State-Save"

    workspaces {
      name = "terraform-state-save"
    }
  }
}