k3d cluster create -p "8000:30000@loadbalancer" --agents 2

kubectl cluster-info
kubectl config use-context k3d-k3s-default

https://istio.io/

export PATH=$PWD/bin:$PATH

istioctl install

kubectl get svc

istioctl install -f samples/bookinfo/demo-profile-no-gateways.yaml -y
kubectl label namespace default istio-injection=enabled

kubectl get namespaces
kubectl get svc -n istio-system
kubectl get po -n istio-system

https://istio.io/latest/docs/setup/getting-started/#download


Install Kiali, grafana, pro
https://istio.io/latest/docs/ops/integrations/


kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.25/samples/addons/prometheus.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.25/samples/addons/jaeger.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.25/samples/addons/kiali.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.25/samples/addons/grafana.yaml

kubectl -n istio-system get svc kiali

istioctl dashboard kiali

kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.25/samples/httpbin/sample-client/fortio-deploy.yaml

kubectl apply -f <(istioctl kube-inject -f https://raw.githubusercontent.com/istio/istio/release-1.25/samples/httpbin/sample-client/fortio-deploy.yaml)


https://istio.io/latest/docs/tasks/traffic-management/circuit-breaking/


Configuring the circuit breaker

kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.25/samples/httpbin/sample-client/fortio-deploy.yaml

export FORTIO_POD=$(kubectl get pods -l app=fortio -o 'jsonpath={.items[0].metadata.name}')

kubectl exec "$FORTIO_POD" -c fortio -- fortio load -c 2 -qps 0 -t 200s -loglevel 
Warning http://nginx-service:8000


kubectl exec -it nginx-a-75846695d-t45mj -- bash
END_TIME=$((SECONDS + 120)); while [ $SECONDS -lt $END_TIME ]; do curl -X GET -s http://nginx-service:8000 && echo ""; done
