data "aws_vpc" "cluster" {
  filter {
    name   = "tag:Name"
    values = ["cluster-vpc"]

  }
}

data "aws_subnet" "clustera" {
  filter {
    name   = "tag:Name"
    values = ["cluster-subnet-private1-sa-east-1a"]
  }
}

data "aws_subnet" "clusterb" {
  filter {
    name   = "tag:Name"
    values = ["cluster-subnet-private2-sa-east-1b"]
  }

}

data "aws_subnet" "clusterc" {
  filter {
    name   = "tag:Name"
    values = ["cluster-subnet-private3-sa-east-1c"]
  }

}

data "aws_iam_role" "name" {
  name = "ecsTaskExecutionRole"
}

data "aws_ecr_repository" "name" {
  name = "fiap-pedidos"
}

data "aws_ecs_cluster" "fiap_pedidos" {
  cluster_name = "cluster-fiap-pedidos"
}

data "aws_db_instance" "database" {
  db_instance_identifier = "db-fiap-pedidos"
}