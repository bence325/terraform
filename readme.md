# Terraform

## Story

After we colonised the Moon, and the internet made its way to the Mars as well, people started to move there. The new Martians want the best of the best technologies, therefore the application infrastructure of the Moon people will simply just not cut it. The mission here is to Terraform everything, including the application that you already deployed to the EKS cluster that you created on the AWS Console by clicking, so whenever the Martians want to create an app, they can deploy it with a push of a button on their M26 processor enhanced MacBook Pro Mars Max X laptop.

## What we have learned during the project

- How to create a larger size of infrastructure with Terraform

---

## Prerequisites

- AWS account
- AWS CLI
- Terraform installed

---

## How to use

1. Create a DynamoDB table on AWS Console with "LockID" as primary partition key
2. Create a S3 bucket on AWS Console
3. Change the values in the following files:
    - backend.tf 
        - profile: aws profile to use (you can check with "cat ~/.aws/config")
        - dynamodb_table: name of the DynamoDB table, which you have created
    - variables.tf
        - here you can set the region, profile, cluster name and EC2 type
4. Use the following commands in terminal:
    - `terraform init`
    - `terraform apply` (check the plan)
    - `terraform apply -delete`, if you want to destroy the infrastructure
    
