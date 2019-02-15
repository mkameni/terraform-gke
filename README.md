### Terraform-gke

This project setup and provision [Google Kubernetes Engine](https://cloud.google.com/) using [Terraform](https://www.terraform.io/)

### Requirements
- [terraform](https://www.terraform.io/)
- [gcloud-sdk](https://cloud.google.com/sdk/docs/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

### Usage
1. Create new GCP project
2. Enable billing on this project
3. Enable the GKE API on this project
4. Generate the service account (using API+Service/Identities/Service Account)
5. Run gcloud commands and check if all values in variables.tf have been corrected setup
```shell
  $ gcloud auth login
  $ gcloud projects list
```
6. Run those commands
```shell
  $ terraform init
  $ terraform plan
  $ terraform apply
```
7. Run the output of the command `terraform apply`
8. Check your kubeconfig context `kubectl config get-contexts`

### Author
Copyright (c) 2019 | mkameni
