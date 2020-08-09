#!/usr/bin/bash

kubectl apply -f k8s/client
kubectl apply -f k8s/server
kubectl apply -f k8s/worker
kubectl apply -f k8s/redis
kubectl apply -f k8s/postgres
kubectl apply -f k8s/gateway
