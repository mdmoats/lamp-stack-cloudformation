# lamp-stack-cloudformation
CloudFormation template that deploys the LAMP stack (specifically Wordpress) on Amazon EC2 and Aurora.

## Prerequsites
This template assumes that you have already...
 - Registered an Amazon Route 53 domain in the target account
 - Requested a public TLS cert from Amazon Certificate Manager that corresponds to the registered Route 53 domain
 - Created an RSA keypair for accessing EC2 instances in the target region

### Useage
Execute the following command to deploy this template via the AWS CLI:
```
aws cloudformation create-stack --stack-name <NAME> --template-body file://<FILENAME>.yaml --role-arn <IAM_ROLE> --capabilities CAPABILITY_NAMED_IAM
```
Alternatively, you may deploy this template via the AWS Management Console as follows. Note that some parameters will be populated with default vaues while others require user input.

![Screenshot 1](https://github.com/mdmoats/lamp-stack-cloudformation/blob/main/assets/images/stack1.png)
![Screenshot 2](https://github.com/mdmoats/lamp-stack-cloudformation/blob/main/assets/images/stack2.png)

### Resource Configuration
Several resources in this template have termination protection, detailed monitoring, and automated backups disabled to reduce deployment costs. Additionally, some IAM policies contain wildcard permissions that should be restricted to specific resources prior to deployment in production. Examine the template in detail and make any desired configuration changes prior to deploying in your environment.
