module "vpc" {
  source               = "./modules/vpc"
  vpc-cidr-block       = var.vpc-cidr-block
  public-subnet-cidrs  = var.public-subnet-cidrs
  private-subnet-cidrs = var.private-subnet-cidrs
  azs                  = var.azs
}

module "sg" {
  source     = "./modules/sg"
  vpc-id     = module.vpc.vpc-id
  cidr-block = module.vpc.cidr-block
}

module "eks" {
  source          = "./modules/eks"
  cluster-name    = var.cluster-name
  node-group-name = var.node-group-name
  instence-types  = var.instence-types
  scaling-config  = var.scaling-config

  private-subnet-ids = module.vpc.private-subnet-ids
  private-sg-ids     = [module.sg.private-sg-id]
  public-sg-ids      = [module.sg.public-sg-id]
  add-ons            = var.add-ons
}

# kuberenetes module configurations
module "k8s" {
  source             = "./modules/k8s"
  cluster-name       = var.cluster-name
  ebs-csi-driver-arn = module.eks.ebs-csi-driver-arn
}

# helm module configurations
module "helm" {
  source = "./modules/helm"
}

# bastion server configurations
module "bastion" {
  source           = "./modules/bastion"
  vpc-id           = module.vpc.vpc-id
  public-subnet-id = module.vpc.bastion-subnet-id
  public-sg-id     = module.sg.public-sg-id
  instance-type    = var.bastion-instance-type
}


