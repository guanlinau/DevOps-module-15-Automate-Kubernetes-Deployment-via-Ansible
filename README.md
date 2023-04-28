### Project:

Automate Kubernetes Deployment

### Technologies used:

Terraform, AWS EKS, Kubernetes, Docker, Linux, Python, Git

### Project Description:

1- Create EKS cluster with Terraform

2-Write Ansible Play to deploy application in a new K8s namespace

### Usage Instructions:

1- Fill in variables into terraform.tfvars to create K8s Cluster in EKS

```
vpc_cidr_block =
private_subnets_block =
public_subnets_block =
```

#sample:

![images](images/Screenshot%202023-04-22%20at%205.38.47%20pm.png)

```
terraform init
```

```
terraform plan
```

###### Create VPC and EKS cluster

```
terraform apply
```

![image](images/Screenshot%202023-04-22%20at%205.57.17%20pm.png)

###### Destroy vpc and EKS cluster

```
terraform destroy
```

###### Configure kubeconfig for this cluster

```
aws eks update-kubeconfig --name myapp-eks-cluster
```

#Check the .kube/config content

```
cat ~/.kube.config
```

###### Write a ansible.yaml to create a namespace for the clusters

![image](images/Screenshot%202023-04-22%20at%2010.15.22%20pm.png)
#check namespace is created successful

```
kubectl get ns
```

![image](images/Screenshot%202023-04-22%20at%209.40.17%20pm.png)

###### Deploy nginx app to the cluster

![image](images/Screenshot%202023-04-22%20at%2010.17.31%20pm.png)
