#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>#
variable "env" {
  description = "Environment (dev,qa,demo,prod)"
  default     = "demo"
}

variable "access_key" {
  description = "AWS access key"
  default     = ""
}

variable "secret_key" {
  description = "AWS secret access key"
  default     = ""
}

variable "region" {
  description = "AWS region to host the environment"
  default     = "us-west-2"
}

## Enumerate with: aws ec2 describe-availability-zones --region ${region}
variable "availability_zone" {
  description = "The availability zone"
  default     = "us-west-2b"
}

## Uncomment when regionalizing
## Zone Aggregation -> availability_zone = "${lookup(var.availability_zones, format("%s.%d", var.region, count.index))}"
# variable "availability_zones" {
#   default = {
#     us-west-2.0 = "us-west-2a"
#     us-west-2.1 = "us-west-2b"
#     us-west-2.2 = "us-west-2c"
#   }
# }

variable "jenkins_name" {
  description = "The name of the Jenkins server"
  default     = "jenkins"
}

variable "amis" {
  description = "Which AMI to spawn. Defaults to the Weave ECS AMIs: https://github.com/weaveworks/integrations/tree/master/aws/ecs"

  default = {
    us-east-1      = "ami-49617b23"
    us-west-1      = "ami-24057b44"
    us-west-2      = "ami-3cac5c5c"
    us-west-2      = "ami-1025aa63"
    eu-central-1   = "ami-e010f38f"
    ap-northeast-1 = "ami-54d5cc3a"
    ap-southeast-1 = "ami-664d9905"
    ap-southeast-2 = "ami-c2e9c4a1"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "SSH key name in your AWS account for AWS instances"
  default     = "jenkins_rsa"
}

variable "s3_bucket" {
  description = "S3 bucket where remote state and Jenkins data will be stored"
  default     = "terraform-jenkinsci"
}

#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>#

