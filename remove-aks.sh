#!/bin/bash

echo "Delete AKS cluster and resource group"
echo 
#Ensure we break on any errors
set -e

rg=$1
aksname=$2

if [ $# -lt 2 ]
then
    echo "You need to pass 1st parameter as the resource group name and second parameter as the cluster name"
    exit
fi

echo Deleting Kubernetes Cluster...
az aks delete --resource-group $rg -n $aksname -y

echo Deleting resource group " $1 " ...
az group delete --name $rg -y


 