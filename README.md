# lamp-stack-cloudformation
This repository contains a CloudFormation template that deploy the LAMP stack (specifically Wordpress) on Amazon EC2 and Aurora.
This template assumes you have already registered an Amazon Route 53 domain, and you've requested a public TLS cert from Amazon Certificate Manager that corresponds to the registered domain.

Execute the following command to deploy this template via the AWS CLI:
aws cloudformation create-stack --stack-name <NAME> --template-body file://<FILENAME>.yaml --role-arn <IAM_ROLE> --capabilities CAPABILITY_NAMED_IAM
