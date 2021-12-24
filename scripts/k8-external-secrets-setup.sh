#!/bin/bash
helm repo add external-secrets https://external-secrets.github.io/kubernetes-external-secrets/
helm install k8-external-secrets external-secrets/kubernetes-external-secrets
