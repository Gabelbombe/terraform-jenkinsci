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
    us-west-2      = "ami-f560d8e3"
    us-east-2      = "ami-13e2c676"
    us-west-1      = "ami-95cc97f5"
    us-west-2      = "ami-4fe87c2f"
    eu-west-1      = "ami-13c8f475"
    eu-west-2      = "ami-8a6276ee"
    eu-central-1   = "ami-216dbc4e"
    ap-northwest-2 = "ami-b2efb5d5"
    ap-southwest-2 = "ami-e152ee82"
    ap-southeast-2 = "ami-ac1b14cf"
    ca-central-1   = "ami-8104b9e5"
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

