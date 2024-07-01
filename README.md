# Two-tier Flask application on Kubernetes

This is a simple Flask app that interacts with a MySQL database. The app allows users to submit messages, which are then stored in the database and displayed on the frontend.

## Prerequisites
- Docker
- Local Kubernetes environment (minikube preferred)
- Git

## Setup
1. Clone the repository: `https://github.com/akhil3shh/flask-on-kubernetes.git`
2. Start minikube using: `minikube start --driver=Docker`
3. Apply all Kubernetes manifest files using: `kubectl apply -f <name-of-manifest-file>` for each manifest file.
4. Get IP address of MySQL service using: `kubectl get svc my-sql`
5. Update this IP address in `app-deployment.yml` under `MYSQL_HOST` 'value'
6. Redeploy the `app-deployment.yml` file to update the changes
7. Enter the `mysql-pod` using: `kubectl exec -it <mysql-pod-name> bash`. Use `mysql -u root -p` to access MySQL. Enter the password `admin`. Enter `use mydb;` and the command present in `messages.sql` of this repository.
8. Open a terminal and enter `minikube service <name-of-your-app-service> --url` to access the application
9. Enter any messages in the box on the frontend. To check these messages in the database, return to the MySQL pod and enter: `select * from messages;`. You'll notice the messages entered on the frontent are refelected in the database.

## Cleanup
1. Delete all deployments and services using `kubectl delete deployment/svc <name-of-deployment/service>`
2. Stop the minikube cluster using `minikube stop`

