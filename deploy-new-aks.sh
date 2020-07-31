#!/bin/bash

echo "Create test AKS cluster and resource group"
echo 

#Ensure we break on any errors
set -e

rg=$1
aksname=$2

#Check number of parameters
if [ $# -lt 2 ]
then
    echo "You need to pass 1st parameter as the resource group name and second parameter as the cluster name"
    exit
fi

echo Creating resource group " $1 " ...
az group create --name $rg --location AustraliaEast

echo Creating Kubernetes Cluster with 1 node...
az aks create --resource-group $rg -n $aksname --node-count 1 --generate-ssh-keys

echo Getting AKS credentials for kubectl to use...
az aks get-credentials --resource-group $rg --name $aksname
 