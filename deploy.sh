docker build -t vvudem/multi-client:latest -t vvudem/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t vvudem/multi-server:latest -t vvudem/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t vvudem/multi-worker:latest -t vvudem/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push vvudem/multi-client:latest
docker push vvudem/multi-server:latest
docker push vvudem/multi-worker:latest

docker push vvudem/multi-client:$SHA
docker push vvudem/multi-server:$SHA
docker push vvudem/multi-worker:$SHA

kubeclt apply -f k8s
kubectl set image deployments/client-deployment client=vvudem/multi-client:$SHA
kubectl set image deployments/server-deployment server=vvudem/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=vvudem/multi-worker:$SHA

