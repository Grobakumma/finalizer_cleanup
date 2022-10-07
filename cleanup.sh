#!/bin/bash

# This script removes the finalizer from all pods within the specified namespace.  
# Just connect to the target cluster and run 'bash cleanup.sh <namespace>'.

echo ""
echo "###########################################################################"
echo "Delete finalizer from all pods in namespace: " $1
echo "###########################################################################"

read -p "Are you sure? (y/n) " -n 1 -r
echo ""   

if [[ $REPLY =~ ^[Yy]$ ]]
then
    TEST=$(kubectl get ns $1 -o=jsonpath='{.items}')
    COUNT=$(kubectl get pods -n $1  -o=jsonpath='{.items}' | jq length)
    i=0
    while [ $i -lt $COUNT ]; do 
    POD=$(kubectl get pods -n $1  -o=jsonpath='{.items[0].metadata.name}')
    kubectl get pod $POD -n $1 -o json | jq 'del(.metadata.finalizers)' | kubectl replace -f -
    echo Finalizer from pod/$POD removed
    : $i && i=$[$i+1]; done
fi