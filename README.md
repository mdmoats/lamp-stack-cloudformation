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
Alternatively, you may deploy this template via the AWS Management Console as follows:

![Screenshot 1](https://github.com/mdmoats/lamp-stack-cloudformation/blob/main/assets/images/stack1.png)
![Screenshot 2](https://github.com/mdmoats/lamp-stack-cloudformation/blob/main/assets/images/stack2.png)
