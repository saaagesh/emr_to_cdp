#!/bin/bash 


 display_usage() { 
	echo "
Usage:
    $(basename "$0") <clusterid> [--help or -h]

Description:
    Describes cluster.

Arguments:
    clusterid:    ID of your cluster
    --help or -h:   displays this help"

}

# check whether user had supplied -h or --help . If yes display usage 
if [[ ( $1 == "--help") ||  $1 == "-h" ]] 
then 
    display_usage
    exit 0
fi 


# Check the numbers of arguments
if [  $# -lt 1 ] 
then 
    echo "Not enough arguments!"
    display_usage
    exit 1
fi 

if [  $# -gt 2 ] 
then 
    echo "Too many arguments!"
    display_usage
    exit 1
fi 


aws emr describe-cluster --cluster-id $1 --region us-east-1