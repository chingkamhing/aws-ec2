# AWS Project

The purpose of this project:

* how to setup AWS EC2 with terraform

## Deploy to AWS

* fix problem: Unable to access object "ec2/terraform.tfstate" in S3 bucket "teraform.kamching"
    + aws profile user need to grand kms:Decrypt permission: attach permission policy "ROSAKMSProviderPolicy" to the profile user
    + aws console go to "KMS > Customer managed keys > terraform-s3", under "Key users", add the corresponding profile user

## References:

* [AWS Tutorial: A Step-by-Step Tutorial for Beginners](https://www.simplilearn.com/tutorials/aws-tutorial)
* [AWS (Amazon Web Services) Tutorial: Basics for Beginners](https://www.guru99.com/aws-tutorial.html)
* VPC
    + [Understanding Amazon VPC Terminology](https://levelup.gitconnected.com/understanding-amazon-vpc-terminology-b3150bb6cde0)
    + [Creating a Custom VPC in AWS](https://levelup.gitconnected.com/creating-a-custom-vpc-in-aws-b4ea7bf4a71)
    + [How to Create AWS VPC in 10 steps, less than 10 min](https://varunmanik1.medium.com/how-to-create-aws-vpc-in-10-steps-less-than-5-min-a49ac12064aa)
    + [Creating your own custom VPC](https://www.javatpoint.com/creating-your-own-custom-vpc)
    + [How to Build AWS VPC using Terraform – Step by Step](https://spacelift.io/blog/terraform-aws-vpc)
* terraform
    + [Configure S3 bucket as Terraform backend [Step-by-Step]](https://www.golinuxcloud.com/configure-s3-bucket-as-terraform-backend/)
    + [Deploying an AWS ECS Cluster of EC2 Instances With Terraform](https://medium.com/swlh/creating-an-aws-ecs-cluster-of-ec2-instances-with-terraform-85a10b5cfbe3)
    + [How to keep your terraform code clean and robust (Part1)?](https://mohamed-dhaoui.medium.com/how-to-keep-your-terraform-code-clean-and-robust-part1-64e2c8034ace)
    + [How to keep your terraform code clean and robust (Part2)](https://mohamed-dhaoui.medium.com/how-to-keep-your-terraform-code-clean-and-robust-part2-e3d913de591c)
    + [AWS VPC — Using Terraform Modules](https://medium.com/cloud-native-daily/aws-vpc-using-terraform-modules-78d02005b745)
