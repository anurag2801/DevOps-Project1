# Automated Infrastructure Deployment with Jenkins, Terraform, and Ansible

## Overview

This project automates the deployment of AWS infrastructure using Jenkins pipelines, Terraform for provisioning, and Ansible for configuration management.

## Technologies Used

- **Jenkins:** Automation server orchestrating pipelines.
- **Terraform:** Infrastructure as Code tool for provisioning AWS resources.
- **Ansible:** Configuration management tool for setting up Docker, AWS CLI, and Docker Compose.
- **AWS:** Cloud platform where infrastructure is provisioned.
- **Terraform Cloud:** Used for storing Terraform state files securely.
- **Credentials Management:** Utilizes Jenkins Credentials Plugin to manage sensitive data such as EC2 private keys, Terraform Cloud credentials, and AWS credentials.

## Pipeline Steps

1. **Checkout:**
   - Jenkins pipeline fetches Terraform configurations from the GitHub repository.

2. **Terraform Init:**
   - Initializes Terraform with necessary plugins and modules.

3. **Terraform Plan:**
   - Generates an execution plan to preview infrastructure changes.

4. **Terraform Apply:**
   - Deploys an EC2 instance with a security group allowing traffic on port 8080.

5. **Ansible Configuration:**
   - Uses Ansible playbook to install Docker, AWS CLI, and Docker Compose on the provisioned EC2 instance.

6. **Input from User:**
   - Utilizes Jenkins Step Plugin to capture user inputs for dynamic configuration.

## Prerequisites

- **Jenkins Setup:**
  - Jenkins installed with required plugins (Terraform, Ansible, Git, Credentials).
  - Configure Jenkins to integrate with Terraform Cloud and AWS.

- **Credentials Management:**
  - Create and securely manage Jenkins credentials for:
    - Terraform Cloud credentials (API token or app ID/key).
    - AWS credentials (Access Key ID and Secret Access Key).
    - EC2 private key for SSH access.

- **GitHub Repository:**
  - Store Terraform configurations in a GitHub repository accessible to Jenkins.

## Usage

1. **Clone the Repository:**
   ```bash
   git clone git@github.com:yourusername/your-repository.git
   cd your-repository
