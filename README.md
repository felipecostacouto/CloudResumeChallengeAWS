# Cloud Resume Challenge (AWS Version)

## Current Status
The project is live, here is my hosted website <https://felipecostacouto.link/>

## Table of Contents
- [Introduction](#introduction)
- [Project Overview](#project-overview)
- [Architecture Diagram](#architecture-diagram)
- [Prerequisites](#prerequisites)
- [Technologies Used](#technologies-used)
- [Steps of the Project](#steps-of-the-project)
- [Blog Post](#blog-post)

## Introduction
Welcome to my Cloud Resume Challenge (AWS Version)! This project showcases the deployment of a personal resume site using various AWS services. You can check out the website that explains the challenger here: [Cloud Resume Challenge](https://cloudresumechallenge.dev/docs/the-challenge/aws/).

## Project Overview
The Cloud Resume Challenge involves creating a resume website and deploying it on the cloud using AWS services. The project includes front-end development, back-end services, infrastructure as code, and continuous integration/continuous deployment (CI/CD).

## Architecture Diagram

![AWS Cloud Architecture diagram for Cloud Resume Challenge.](/docs/archdiagram/CRC.drawio.png) 

## Prerequisites
- AWS Account
- Basic understanding of HTML, CSS, and JavaScript
- Familiarity with AWS services (S3, Lambda, API Gateway, DynamoDB, Route 53, ACM, IAM)
- Git and GitHub account
- Some Python Knowledge
- Terraform installed on your local machine
- AWS CLI configured with your credentials

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
- Tests using Cypress and Pytest

## Steps of the Project

### Requirements

To complete the Cloud Resume Challenge I used the following requirements:

1. **HTML**: 
   - Your resume must be created using HTML. ✅

2. **CSS**: 
   - Style your resume with CSS. Basic styling is sufficient. ✅

3. **Static Website**: 
   - Host your HTML resume on Amazon S3 as a static website. Ensure it uses HTTPS by configuring CloudFront. ✅

4. **DNS**: 
   - Set up a custom domain for your CloudFront distribution using Route 53. ✅

5. **JavaScript**: 
   - Implement a visitor counter on your webpage. ✅

6. **Database**: 
   - Use Amazon DynamoDB to track and update visitor counts. ✅

7. **API**: 
   - Develop an API using AWS API Gateway and Lambda to communicate with DynamoDB. ✅

8. **Python**: 
   - Write Lambda functions in Python, using the boto3 library for AWS interactions. ✅

9. **Tests**: 
   - Include tests for your Python code using Pytest. ✅

10. **Infrastructure as Code**: 
    - Define and manage your infrastructure using Terraform for automated deployment and scalability. ✅

11. **CI/CD with GitHub Actions**: 
    - Set up GitHub Actions to automatically deploy your website code, run tests, invalidate cache, and deploy the infrastructure defined in Terraform. ✅

## Blog Post
[Troubleshooting Your Way Through the Cloud Resume Challenge](https://dev.to/felipe_costacouto/troubleshooting-your-way-through-the-cloud-resume-challenge-59c3)

---
