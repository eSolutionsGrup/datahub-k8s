
# Download Spark 3.1.2
wget https://dlcdn.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz
tar -xf spark-3.1.2-bin-hadoop3.2.tgz

cd spark-3.1.2-bin-hadoop3.2/bin

# Build Spark Base Image
eval $(minikube docker-env)
./docker-image-tool.sh -m -t 3.1.2 build
docker tag spark:3.1.2  basespark:3.1.2

# Build Spark History Server
docker build . -t spark-history-server:1.0
docker push spark-history-server:1.0

# Deploy Spark History Image
kubectl apply -f spark-history-server/deployment.yaml
