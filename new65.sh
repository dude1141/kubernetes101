apiVersion: v1
kind: ReplicaSet
metadata:
  name: myapp-replicaset
  labels:
    app: myapp
    type: front-end
spec:
  replicas: 3  # Specify the number of replicas (adjust as needed)
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      name: myapp-pod
      labels:
        app: myapp
        type: front-end
    spec:
      containers:
        - name: nginx-container
          image: nginx

		  
kubectl run nginx --image=nginx

kubectl describe pod nginx

controlplane ~ ➜  kubectl get pods
NAME    READY   STATUS    RESTARTS   AGE
nginx   1/1     Running   0          101s

controlplane ~ ✖ vi replicaset-definition.yml

controlplane ~ ➜  kubectl create -f replicaset-definition.yml
replicaset.apps/myapp-replicaset created

controlplane ~ ➜  kubectl get replicasets
NAME               DESIRED   CURRENT   READY   AGE
myapp-replicaset   3         3         3       12s



controlplane ~ ➜  kubectl get replicasets
NAME               DESIRED   CURRENT   READY   AGE
myapp-replicaset   3         3         3       12s

controlplane ~ ➜  kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
nginx                    1/1     Running   0          12m
myapp-replicaset-qjl4p   1/1     Running   0          27s
myapp-replicaset-zj5hz   1/1     Running   0          27s
myapp-replicaset-jqx4p   1/1     Running   0          27s


  