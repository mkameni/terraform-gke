### Terraform-gke

This project setup and provision Google Kubernetes Engine using Terraform

### Requirements
- Terraform
- gcloud-sdk
- kubectl

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
6.
```shell
  $ terraform init
  $ terraform plan
  $ terraform apply
```
7. Run the output of the command `terraform apply`
8. Check your kubeconfig context `kubectl config get-contexts`
