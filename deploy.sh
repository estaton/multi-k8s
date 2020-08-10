docker build -t estaton/multi-client:latest -t estaton/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t estaton/multi-server:latest -t estaton/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t estaton/multi-worker:latest -t estaton/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push estaton/multi-client:latest
docker push estaton/multi-server:latest
docker push estaton/multi-worker:latest

docker push estaton/multi-client:$SHA
docker push estaton/multi-server:$SHA
docker push estaton/multi-worker:$SHA

kubectl apply -f k8s/client
kubectl apply -f k8s/server
kubectl apply -f k8s/worker
kubectl apply -f k8s/redis
kubectl apply -f k8s/postgres
kubectl apply -f k8s/gateway

kubectl set image deployments/client-deployment client-deployment=estaton/multi-client:$SHA
kubectl set image deployments/server-deployment server-deployment=estaton/multi-server:$SHA
kubectl set image deployments/worker-deployment worker-deployment=estaton/multi-worker:$SHA