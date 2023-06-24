# Simple WordPress Apache with Terraform

This project provides a simple way to deploy a WordPress server using Apache on AWS, orchestrated by Terraform. 

## Requirements

- Terraform
- AWS CLI
- AWS Account
- Git

## Step-by-Step Instructions

### Step 0: What are Terraform, AWS, and Git?

1. **Terraform** is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.
2. **AWS (Amazon Web Services)** is a cloud services platform that provides compute power, database storage, content delivery, and other functionality to help businesses scale and grow.
3. **Git** is a distributed version control system for tracking changes in source code during software development.

### Step 1: Install Git

1. Go to the [Git download page](https://git-scm.com/downloads).
2. Download the software for your operating system.
3. Run the installer and follow the prompts to install Git.

### Step 2: Install Terraform

1. Download Terraform from the [official download page](https://www.terraform.io/downloads.html).
2. Unzip the package and move the executable to a directory included in your system's `PATH`.
3. Verify the installation by running `terraform --version` in the terminal.

### Step 3: Setup an AWS Account

1. Go to the [AWS website](https://aws.amazon.com/) and create a new account if you don't have one already.
2. Log in to your AWS Account.

### Step 4: Create an IAM user

1. Navigate to the IAM service in the AWS Management Console.
2. Click on "Users" in the sidebar and then "Add user".
3. Enter a username, select "Programmatic access" as the access type, and click "Next".
4. In the permissions step, select "Attach existing policies directly" and in the filter policies box, type "AdministratorAccess" then check the box next to it.
5. Review the user and permissions, then click "Create user".
6. On the success page, save the "Access key ID" and "Secret access key". You will need these later.

### Step 5: Install and Configure AWS CLI

1. Download the AWS CLI from the [official download page](https://aws.amazon.com/cli/).
2. Install it by following the instructions provided for your operating system.
3. Once installed, open your terminal and type `aws configure`.
4. When prompted, enter the "Access key ID" and "Secret access key" that you saved earlier.
5. Enter `us-west-2` for the Default region name.
6. Enter `json` for the Default output format.

### Step 6: Clone the Repository and Initialize Terraform

1. Open your terminal and navigate to the directory where you want to clone the repository.
2. Run `git clone https://github.com/olufuwatayo/simple-wordpress-apache.git`.
3. Navigate into the cloned directory with `cd simple-wordpress-apache`.
4. Run `terraform init` to initialize Terraform.

### Step 7: Apply Terraform Configuration

1. To create the resources defined in your Terraform files, run `terraform apply`.
2. Terraform will print the actions to be taken. Review them and enter `yes` when prompted.

### Step 8: Connect to the EC2 Instance

After Terraform has finished creating the resources, you should be able to connect to your EC2 instance and view your WordPress installation.

1. In the AWS Console, navigate to the EC2 Dashboard.
2. Find your instance and copy its Public IPv4 address.
3. In your web browser, navigate to `http://<your-ec2-public-ipv4-address>`. Replace `<your-ec2-public-ipv4-address>` with the Public IPv4 address you just copied.

Congratulations, you should now see your WordPress installation!

## Troubleshooting

If you encounter any problems, please review the steps to make sure everything was done correctly. If the problem persists, you may find help in the [Terraform community](https://learn.hashicorp.com/terraform).

