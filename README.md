# tf-ansible-k8s-jenkins
# Automated Kubernetes Deployment with Jenkins, Terraform, and Ansible

# Overview
This project demonstrates an end-to-end DevOps workflow that provisions AWS infrastructure with Terraform, configures servers into a Kubernetes cluster using Ansible, and deploys workloads via Jenkins CI/CD pipeline. A sample application is deployed on Kubernetes using Deployment and Service manifests.

# Architecture
1. Terraform provisions AWS EC2 instances and security groups.
2. Ansible configures EC2 nodes with Docker, kubeadm, and kubectl to form a Kubernetes cluster.
3. Jenkins Pipeline orchestrates the workflow:
   - Stage 1: Run Terraform (`apply`/`destroy`)
   - Stage 2: Run Ansible playbook to configure cluster
   - Stage 3: Apply Kubernetes manifests (Deployment + Service)
4. Kubernetes runs the application and exposes it via NodePort.

# Project Structure
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── terraform.tfvars (optional overrides)
├── ansible/
│   ├── play-book.yml
│   └── inventory.ini
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
├── Jenkinsfile
└── README.md

# Tech Stack
- Terraform → Infrastructure as Code (AWS EC2, Security Groups)
- Ansible → Configuration management (Docker, Kubernetes setup)
- Jenkins → CI/CD pipeline orchestration
- Kubernetes → Container orchestration (Deployment, Service)

# Skills Demonstrated
- Infrastructure provisioning with Terraform
- Server configuration automation with Ansible
- CI/CD pipeline design with Jenkins
- Kubernetes workload deployment
- AWS cloud fundamentals (EC2, networking, security groups)

# Usage
1. Run Jenkins pipeline:
   - Stage 1: `terraform apply` → provisions EC2 nodes
   - Stage 2: `ansible-playbook -i inventory.ini play-book.yml` → configures cluster
   - Stage 3: `kubectl apply -f k8s/deployment.yaml` and `kubectl apply -f k8s/service.yaml`
2. Access the application via NodePort: `http://<EC2-IP>:30080`

# Future Improvements
- Use Terraform backend (S3 + DynamoDB) for state management
- Add Jenkins approval stage before `terraform apply`
- Scale to multi-node Kubernetes cluster with worker join scripts
- Integrate monitoring (Prometheus/Grafana)

