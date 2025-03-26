# Make the spark app run on Kubernetes

This is a simple example of how to run a spark application on Kubernetes.

An available kubernetes cluster is required. The example uses k3d.

## Minio

### Installation

Install minio through the community's helm chart:

Add the helm repo:
```bash
helm repo add minio https://charts.min.io/
helm repo update
```

Install minio toy, for dev purposes:
```bash
helm install --set resources.requests.memory=512Mi --set replicas=1 --set persistence.enabled=false \
    --set mode=standalone --set rootUser=rootuser,rootPassword=rootpass123 --generate-name minio/minio
```

### Configuration

**IN the minio pod:**

Create a bucket:
```bash
mc alias set minio http://localhost:9000 rootuser rootpass123
mc mb local/bucket
```

> [!WARNING]
> spark-operator's SparkApplication don't support S3A, so we need to use the Minio's http API.

Set it to public:
```bash
mc policy set public local/bucket
```

## Spark

Build the spark executable:
```bash
cd spark
env JAVA_OPTS="-Xmx10G" sbt assembly # The 1G memory limit is not enough, so upgrade the memory limit from 1G to 10G just because we can
``` 

Then upload the build (in `target/scala-2.12/Simple_Project-assembly-1.0.jar`) to the minio bucket, as well as the `users.csv` file.

## Kubernetes

### Spark Operator

Add the helm repo:
```bash
helm repo add spark-operator https://kubeflow.github.io/spark-operator
helm repo update
```

Install the spark operator:
```bash
helm install spark-operator spark-operator/spark-operator \
    --namespace spark-operator --create-namespace --wait
```

### Spark Application

Add the service account:
```bash
kubectl apply -f kube/service-account.yaml
```

Add the spark application:
```bash
kubectl apply -f kube/deployment.yaml
```

Wait and check the logs !