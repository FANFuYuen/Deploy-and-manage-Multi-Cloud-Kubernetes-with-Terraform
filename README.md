# ITP4121_Project

This is the project for ITP4121, The purpose of this project is make a mutli-cloud solution

## Architecture

<img></img>

## Install CLIs
Install AWS CLI
https://aws.amazon.com/tw/cli/ <br>
Install Google CLI
https://cloud.google.com/sdk/docs/install <br>
Install Azure CLI
https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli <br>
Install Terraform
https://developer.hashicorp.com/terraform/install?product_intent=terraform <br>

if needed (not installer) set global environment variables in
"system variables -> Path" to set folder path

To test CLIs <br>
AWS: <code>aws help</code> <br>
GCP: <code>gcloud help</code> <br>
Azure: <code>az help</code> <br>
terraform: <code>terraform -help</code> <br>

## Login <br>
AWS: <code>aws help</code> <br>
GCP: <code>gcloud auth application-default login </code> <br>
Azure: <code>az help</code> <br>

Set current workspace
<code> gcloud config set project VALUE </code>
Create Service account
<code>
gcloud iam service-accounts create [SERVICE_ACCOUNT_NAME] \
  --display-name "[DISPLAY_NAME]"
</code>
Set service account role
<code>
gcloud projects add-iam-policy-binding [PROJECT_ID] \
    --member "serviceAccount:[SERVICE_ACCOUNT_EMAIL]" \
    --role roles/owner
</code>
Create service account key
<code>
gcloud iam service-accounts keys create [FILE_NAME].json \
  --iam-account [SERVICE_ACCOUNT_EMAIL]
</code>

# Learn Terraform - Deploy Federated Multi-Cloud Kubernetes Clusters

This is a companion repository with part of the configuration for the [Deploy
Federated Multi-Cloud Kubernetes Clusters
tutorial](https://developer.hashicorp.com/terraform/tutorials/networking/multicloud-kubernetes). It contains Terraform
configuration files for you to use to learn deploy a Consul-federated
multi-cluster Kubernetes setup.

.venv\Scripts\activate