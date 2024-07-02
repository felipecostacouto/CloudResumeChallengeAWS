# Cloud Resume Challenge (AWS Version)

## Table of Contents
- [Introduction](#introduction)
- [Project Overview](#project-overview)
- [Architecture Diagram](#architecture-diagram)
- [Prerequisites](#prerequisites)
- [Technologies Used](#technologies-used)
- [Setup Instructions](#setup-instructions)


## Introduction
Welcome to the Cloud Resume Challenge (AWS Version)! This project showcases the deployment of a personal resume site using various AWS services.

## Project Overview
The Cloud Resume Challenge involves creating a resume website and deploying it on the cloud using AWS services. The project covers front-end development, back-end services, infrastructure as code, and continuous integration/continuous deployment (CI/CD).

## Architecture Diagram
(Include an architecture diagram here to visualize the AWS services and how they interact.)

## Prerequisites
- AWS Account
- Basic understanding of HTML, CSS, and JavaScript
- Familiarity with AWS services (S3, Lambda, API Gateway, DynamoDB, Route 53)
- Git and GitHub account

## Technologies Used
- HTML, CSS, JavaScript
- AWS S3
- AWS Lambda
- AWS API Gateway
- AWS DynamoDB
- AWS CloudFront
- AWS Route 53
- AWS IAM
- GitHub Actions
- Terraform

## Setup Instructions
1. **Clone the Repository**:
   ```sh
   git clone https://github.com/felipecostacouto/CloudResumeChallengeAWS.git
   cd cloud-resume-challenge

## CLI commands
**In case of creating the resources via CLI**:
    
    # Create bucket
    - aws S3 mb s3://BUCKET_NAME --region YOUR_REGION

    # Insert File (individual)
    - aws s3 cp FILE_NAME s3://BUCKET_NAME

    #Insert Files (multiple)
    - aws s3 sync my-files s3://BUCKET_NAME
