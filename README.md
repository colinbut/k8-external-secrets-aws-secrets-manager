# Kubernetes - External Secrets - AWS Secrets Manager

## Starting K8 Cluster (Minikube)

```bash
minikube start
```

## Store a Secret

e.g.
```bash
aws secretsmanager create-secret --name [my_secret_path] --secret-string [my_secret_value]
```

## Configuring K8 External Secrets
```bash
./scripts/k8-external-secrets-setup.sh
```

## Deploy External Secret & Sample App

```bash
kubectl apply -f k8/k8-external-secret-api-key.yaml
kubectl apply -f k8/k8-java-app-deployment.yaml
```

## Authors

Colin But.