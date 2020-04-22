docker build -t vvudem/multi-client:latest -t vvudem/multi-client:V16 -f ./client/Dockerfile ./client
docker build -t vvudem/multi-server:latest -t vvudem/multi-server:V16 -f ./server/Dockerfile ./server
docker build -t vvudem/multi-worker:latest -t vvudem/multi-worker:V16 -f ./worker/Dockerfile ./worker

docker push vvudem/multi-client:latest
docker push vvudem/multi-server:latest
docker push vvudem/multi-worker:latest

docker push vvudem/multi-client:V16
docker push vvudem/multi-server:V16
docker push vvudem/multi-worker:V16

kubeclt apply -f k8s
kubectl set image deployments/client-deployment client=vvudem/multi-client:V16
kubectl set image deployments/server-deployment server=vvudem/multi-server:V16
kubectl set image deployments/worker-deployment worker=vvudem/multi-worker:V16

