# A nice solution to deploy an Ubuntu and Apache-based web server running the latest WordPress using Terraform and Ansible hosted on the Amazon EC2 virtual machine instance.
## Details of the automated provisioner
### Supported cloud: 
- AWS
## This solution creates a web server in the following order: 
### Deployment of Amazon EC2 done using the latest versions of: 
- Terraform
### Provisioning of the Amazon EC2 instance done using the latest version of: 
- Ansible
### Configuring the webserver using Ansible. The latest versions of below are being used: 
- Apache HTTP Server
- MySQL/MariaDB
- PHP
## Prerequisites
- The  [Terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)  (0.14.9+) installed.
- The  [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)  installed.
- [An AWS account](https://aws.amazon.com/free/).
- Your AWS credentials. You can  [create a new Access Key on this page](https://console.aws.amazon.com/iam/home?#/security_credentials).
- export AWS_ACCESS_KEY_ID="anaccesskey"
- export AWS_SECRET_ACCESS_KEY="asecretkey"

Configure the AWS CLI from your terminal. Follow the prompts to input your AWS Access Key ID and Secret Access Key.

```terminal
aws configure
```
The configuration process stores your credentials in a file at ~/.aws/credentials on MacOS and Linux, or %UserProfile%\.aws\credentials on Windows.

Note: This solution will provision resources that qualify under the AWS free tier. We are not responsible for any charges that you may incur.
