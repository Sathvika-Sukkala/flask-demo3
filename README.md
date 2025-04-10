# Local DevOps Sandbox with Terraform and Docker

## Overview
This project provisions a local DevOps sandbox using Terraform and Docker. It includes:
- Flask app container
- Redis container
- Nginx container
- cAdvisor monitoring

## Usage

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Preview the plan
```bash
terraform plan
```

### 3. Apply the configuration
```bash
terraform apply
```

### 4. Visit Flask App
Open [http://localhost:5000](http://localhost:5000)

### 5. Visit cAdvisor
Open [http://localhost:9090](http://localhost:9090)

### 6. Destroy infrastructure
```bash
terraform destroy
```
