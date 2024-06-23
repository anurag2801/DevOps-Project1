Automated Infrastructure Deployment with Jenkins, Terraform, and Ansible

This project demonstrates automated deployment of AWS infrastructure using Jenkins pipelines, Terraform for provisioning, and Ansible for configuration management.
Overview

This project utilizes Jenkins to automate the entire deployment process. Jenkins pipelines are defined as code (Declarative Pipeline) and can be triggered manually or automatically upon changes to the GitHub repository containing Terraform configurations.
Technologies Used

    Jenkins: Automation server orchestrating pipelines.
    Terraform: Infrastructure as Code tool for provisioning AWS resources.
    Ansible: Configuration management tool for setting up Docker, AWS CLI, and Docker Compose.
    AWS: Cloud platform where infrastructure is provisioned.
    Terraform Cloud: Used for storing Terraform state files securely.
    Credentials Management: Utilizes Jenkins Credentials Plugin to manage sensitive data such as EC2 private keys, Terraform Cloud credentials, and AWS credentials.

Pipeline Steps

    Checkout:
        Jenkins pipeline fetches Terraform configurations from the GitHub repository.

    Terraform Init:
        Initializes Terraform with necessary plugins and modules.

    Terraform Plan:
        Generates an execution plan to preview infrastructure changes.

    Terraform Apply:
        Deploys an EC2 instance with a security group allowing traffic on port 8080.

    Ansible Configuration:
        Uses Ansible playbook to install Docker, AWS CLI, and Docker Compose on the provisioned EC2 instance.

    Input from User:
        Utilizes Jenkins Step Plugin to capture user inputs for dynamic configuration.

Prerequisites

    Jenkins Setup:
        Jenkins installed with required plugins (Terraform, Ansible, Git, Credentials).
        Configure Jenkins to integrate with Terraform Cloud and AWS.

    Credentials Management:
        Create and securely manage Jenkins credentials for:
            Terraform Cloud credentials (API token or app ID/key).
            AWS credentials (Access Key ID and Secret Access Key).
            EC2 private key for SSH access.

    GitHub Repository:
        Store Terraform configurations in a GitHub repository accessible to Jenkins.

Usage

    Clone the Repository:

    bash

    git clone git@github.com:yourusername/your-repository.git
    cd your-repository

    Configure Jenkins Pipeline:
        Create a Jenkins pipeline job using the provided Jenkinsfile.
        Configure the pipeline to trigger on changes to the GitHub repository.

    Run the Pipeline:
        Trigger the Jenkins pipeline manually or automatically upon changes.
        Monitor pipeline execution in the Jenkins console for progress and logs.

Validation

    Verify Infrastructure:
        Check AWS Management Console for the provisioned EC2 instance and associated security group settings.

    Verify Configuration:
        SSH into the EC2 instance to verify installations of Docker, AWS CLI, and Docker Compose.

Security Considerations

    Credential Security:
        Manage sensitive credentials securely within Jenkins using the Credentials Plugin.
        Implement least privilege principles for AWS IAM roles and policies used by Terraform and Ansible.

    Network Security:
        Ensure proper network configurations and security group settings to restrict access as needed.

Troubleshooting

    Pipeline Issues:
        Refer to Jenkins console output for error messages and logs during pipeline execution.
        Verify AWS IAM permissions and network connectivity if Terraform or Ansible operations fail.
