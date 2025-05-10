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

  depends_on = [module.vpc]
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

  depends_on = [module.sg]
}

# kuberenetes module configurations
module "k8s" {
  source             = "./modules/k8s"
  cluster-name       = var.cluster-name
  ebs-csi-driver-arn = module.eks.ebs-csi-driver-arn

  depends_on = [module.eks]
}

# helm module configurations
module "helm" {
  source = "./modules/helm"

  depends_on = [module.k8s]
}

# bastion server configurations
module "bastion" {
  source           = "./modules/bastion"
  vpc-id           = module.vpc.vpc-id
  public-subnet-id = module.vpc.bastion-subnet-id
  public-sg-id     = module.sg.public-sg-id
  instance-type    = var.bastion-instance-type

  depends_on = [module.eks, module.vpc, module.sg]
}


