# Deploying a Static Website on AWS

This project demonstrates how to deploy a static website on **Amazon Web Services (AWS)** using **Amazon S3**, **CloudFront**, and **Terraform**. The website is securely stored in an S3 bucket, served globally via CloudFront, and restricted using Origin Access Identity (OAI). Terraform automates the deployment process.

## Features
- **Secure Storage**: Static files (HTML, CSS) are stored in **Amazon S3** with restricted access.
- **Fast Content Delivery**: **CloudFront CDN** ensures low-latency performance worldwide.
- **Access Control**: **OAI** prevents direct access to S3, allowing only CloudFront to fetch content.
- **Infrastructure as Code (IaC)**: **Terraform** automates AWS resource provisioning.

## Deployment Steps

### 1. Set Up AWS Credentials
- Create an **IAM user** with programmatic access.
- Attach policies: `AmazonS3FullAccess`, `CloudFrontFullAccess`.
- Configure AWS CLI:
  ```sh
  aws configure
  ```

### 2. Install Required Tools
- Install **AWS CLI** and **Terraform**:
  ```sh
  terraform --version
  ```

### 3. Create and Configure S3 Bucket
- Create an **S3 bucket** (e.g., `aws-static-site`).
- Block **public access** to secure the content.
- Set up a **bucket policy** to allow access only from CloudFront.

### 4. Deploy CloudFront as CDN
- Create a **CloudFront distribution** and set the S3 bucket as the origin via OAI.
- Configure caching and security settings.

### 5. Automate with Terraform
- Initialize Terraform:
  ```sh
  terraform init
  ```
- Validate and apply the configuration:
  ```sh
  terraform validate
  terraform apply -auto-approve
  ```
- Retrieve the **CloudFront URL** from Terraform output.

## Project Structure
```
aws-static-site/
│── terraform/                # Terraform configuration files
│   │── provider.tf           # AWS provider setup
│   │── variables.tf          # Variables for AWS region and S3 bucket name
│   │── main.tf               # S3 bucket setup (private, OAI access only)
│   │── cloudfront.tf         # CloudFront distribution setup
│   │── outputs.tf            # Output values for website URLs
│   │── versions.tf           # Required Terraform version
│   │── terraform.tfvars      # Default values for variables (e.g., bucket name, AWS region)
│── website/                  # Static website files
│   │── index.html            # Homepage
│   │── style.css             # Website styles
│   │── error.html            # Custom error page (CloudFront response)
```

## Challenges & Solutions
- **Direct S3 Access Risk** → Used **CloudFront + OAI** to restrict access.
- **Manual Setup Complexity** → Automated deployment with **Terraform**.

## Usage
Once deployed, access the website using the **CloudFront URL** from the Terraform output.

## License

This project is licensed under the MIT License. See `LICENSE` for details.

## Contributors

- Negin Hezarjaribi - [GitHub Repository](https://github.com/NeginHz/aws-static-website)
