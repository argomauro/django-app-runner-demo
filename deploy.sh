#!/bin/bash

# Nome dell'immagine
IMAGE_NAME="pignolalug/django-test"

# AWS ECR registry completo
AWS_ACCOUNT_ID="480034210746"
REGION="eu-west-1"
ECR_REPO="${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${IMAGE_NAME}"

# Recupera il tag da linea di comando, default a 'latest' se non specificato
TAG=${1:-latest}

echo "🔨 Building Docker image: ${IMAGE_NAME}:${TAG}"
docker build -t ${IMAGE_NAME}:${TAG} -t ${IMAGE_NAME}:latest .

echo "🏷️ Tagging image for ECR: ${ECR_REPO}:${TAG}"
docker tag ${IMAGE_NAME}:${TAG} ${ECR_REPO}:${TAG}

echo "🔐 Logging in to AWS ECR..."
aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com

echo "📤 Pushing image to ECR..."
docker push ${ECR_REPO}:${TAG}

echo "✅ Done! Image pushed as: ${ECR_REPO}:${TAG}"