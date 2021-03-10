#!/bin/sh

minikube delete
minikube --vm-driver=docker start

docker system prune -f
docker images rm
kubectl delete deployments --all
kubectl delete pods --all
kubectl delete services --all
kubectl delete persistentvolumeclaims --all

minikube addons enable dashboard
minikube addons enable metrics-server

export MINI_IP=$(minikube ip)
echo IP minikube: $MINI_IP
envsubst '$MINI_IP' < srcs/metallb.yml > ./srcs/metallb_ip.yml
envsubst '$MINI_IP' < srcs/wordpress.yml > ./srcs/wordpress_ip.yml
envsubst '$MINI_IP' < srcs/ftps.yml > ./srcs/ftps_ip.yml
minikube addons enable metallb

eval $(minikube docker-env)
kubectl apply -f ./srcs/metallb_ip.yml
rm ./srcs/metallb_ip.yml

kubectl apply -f ./srcs/mysql_secrets.yml
kubectl apply -f ./srcs/influxdb_secrets.yml

docker build -t img_nginx ./srcs/img_nginx
docker build -t my-nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx.yml

docker build -t my-mysql ./srcs/mysql
kubectl apply -f ./srcs/mysql.yml

docker build -t my-wordpress ./srcs/wordpress
kubectl apply -f ./srcs/wordpress_ip.yml
rm ./srcs/wordpress_ip.yml

docker build -t my-phpmyadmin ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin.yml

docker build -t my-ftps ./srcs/ftps
kubectl apply -f ./srcs/ftps_ip.yml
rm ./srcs/ftps_ip.yml

docker build -t my-influxdb ./srcs/influxdb
kubectl apply -f ./srcs/influxdb.yml

docker build -t my-telegraf ./srcs/telegraf
kubectl apply -f ./srcs/telegraf.yml

docker build -t my-grafana ./srcs/grafana
kubectl apply -f ./srcs/grafana.yml

kubectl get svc
minikube dashboard
