module "my-cluster" {
  source       = "./eks-modules"
  cluster_name = "my-cluster"
  subnets      = ["subnet-0c890bc2f5db53737", "subnet-0da9ef1545a6dca38"]
  vpc_id       = "vpc-0a72638726b7bf7ee"
  aws_region   = "ap-south-1"
  cluster_version = "1.14"
  
  worker_groups = [
    {
      instance_type = "t2.medium"
      asg_max_size  = 5
      key_name      = "eks"
      asg_min_size  = 1
      asg_desired_capacity = 1

    }
  ]
  tags = {
    environment = "test"
  }
}
