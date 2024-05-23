# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group

resource "aws_eks_node_group" "node_group" {
  cluster_name = var.EKS_CLUSTER_NAME
  node_group_name = "${var.EKS_CLUSTER_NAME}-node_group"
  node_role_arn = var.NODE_GROUP_ARN

  # Identifiers of EC2 Subnets to associate with the EKS Node Group. 
  # These subnets must have the following resource tag: kubernetes.io/cluster/EKS_CLUSTER_NAME 

  subnet_ids = [
    var.PRI_SUB3_ID,
    var.PRI_SUB4_ID
  ]

  # Configuration block
  scaling_config {
    desired_size = 2
    max_size = 2
    min_size = 2
  }
 
  ami_type = "AL2_x86_64"
  instance_types = ["t3.small"]
  disk_size = 20


  # Type of capacity associated with the EKS Node Group
   capacity_type = "ON_DEMAND"


  # Force version update if existing pods are unable to be drained due to a pod disruption budget issue
  force_update_version = false

  

  labels = {
    role = "${var.EKS_CLUSTER_NAME}-Node-group-role",
    name = "${var.EKS_CLUSTER_NAME}-node_group"
  }

  # Kubernetes version
  version = "1.27"
}
