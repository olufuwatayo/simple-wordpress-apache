# Simple WordPress Apache with Terraform

This project provides a simple way to deploy a WordPress server using Apache on AWS, orchestrated by Terraform. 

## Requirements

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- AWS Account
- [Git](https://git-scm.com/downloads)

## Step-by-Step Instructions

### Step 1: Install Terraform

1. Download Terraform from the [official download page](https://www.terraform.io/downloads.html).
2. Unzip the package and move the executable to a directory included in your system's `PATH`.
3. Verify the installation by running `terraform --version` in the terminal.

### Step 2: Setup an AWS Account

1. Go to the [AWS website](https://aws.amazon.com/) and create a new account if you don't have one already.
2. Log in to your AWS Account.

### Step 3: Create an IAM user

1. Navigate to the IAM service in the AWS Management Console.
2. Click on "Users" in the sidebar and then "Add user".
3. Enter a username, select "Programmatic access" as the access type, and click "Next".
4. In the permissions step, select "Attach existing policies directly" and in the filter policies box, type "AdministratorAccess" then check the box next to it.
5. Review the user and permissions, then click "Create user".
6. On the success page, save the "Access key ID" and "Secret access key". You will need these later.

### Step 4: Configure AWS CLI

1. Install the AWS CLI. You can download it from the [official download page](https://aws.amazon.com/cli/).
2. Open your terminal and type `aws configure`.
3. When prompted, enter the "Access key ID" and "Secret access key" that you saved earlier.
4. Enter `us-west-2` for the Default region name.
5. Enter `json` for the Default output format.

### Step 5: Clone the Repository and Initialize Terraform

1. Open your terminal and navigate to the directory where you want to clone the repository.
2. Run `git clone https://github.com/olufuwatayo/simple-wordpress-apache.git`.
3. Navigate into the cloned directory with `cd simple-wordpress-apache`.
4. Run `terraform init` to initialize Terraform.

### Step 6: Apply Terraform Configuration

1. To create the resources defined in your Terraform files, run `terraform apply`.
2. Terraform will print the actions to be taken. Review them and enter `yes` when prompted.

### Step 7: Connect to the EC2 Instance

After Terraform has finished creating the resources, you should be able to connect to your EC2 instance and view your WordPress installation.

1. In the AWS Console, navigate to the EC2 Dashboard.
2. Find your instance and copy its Public IPv4 address.
3. In your web browser, navigate to `http://<your-ec2-public-ipv4-address>`. Replace `<your-ec2-public-ipv4-address>` with the Public IPv4 address you just copied.

Congratulations, you should now see your WordPress installation!

## Troubleshooting

If you encounter any problems, please review the steps to make sure everything was done correctly. If the problem
