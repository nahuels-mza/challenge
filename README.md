# Solution to the proposal excercise

## The task to complete is defined as it follows

Build some type of automation that could eventually be run in a CI/CD pipeline that does the
following:

1. Write a shell script to build docker image with the following requirements
a. Read the base image name and base image tag from a text file.
b. Use github repo https://github.com/nrupendesai/debugApp for docker file. Modify
the dockerfile as needed.
c. Build docker image from base image using #a.
2. Deploy node application image you built in step #1 with the following requirements
a. Build/create helm chart
b. Expose the API using NGINX Ingress Controller
c. Attach ephemeral storage to the container
3. Harden the container using common CIS rules
a. Container should run as non-root user
b. The pod filesystem should be read-only

While working on the Application you can assume that,
1. You have cluster admin access to deploy the application.
2. The nginx ingress controller is deployed. The available ingress class i `rf-nginx`
3. The cluster is also configured with storage provisioner. The available storage class is
`rf-storage-rw`
Send us this automation with some details on how you created it

## The implementation

Inside the *image_info.txt* file you can specify the image name and the version to be replaced in the Dockerfile. Then run the
```
sh buil.sh
```
file to clone the code, replace the image:tag and build the solution

The folder helm contains the files to make a release of the needed infrastructure so the application can start

```
helm install svitla-app helm
```

### Check implementations

Serivce:
```
kubectl get services -n svitla
```
Deployment:
```
kubectl exec -it -n svitla -l app=svitla-app  -- sh -> id
```
Ingress:
```
kubectl describe ingress
```
