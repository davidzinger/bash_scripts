#!/bin/bash
while getopts t: flag
do
    case "${flag}" in
        t) tag=${OPTARG};;

    esac
done
#login to aws ecr
aws ecr get-login-password --region us-west-1 | docker login --username AWS --password-stdin 333082661382.dkr.ecr.us-west-1.amazonaws.com

#pull image
docker pull 333082661382.dkr.ecr.us-west-1.amazonaws.com/status_page_image:$tag

#killing all others running containers
docker kill $(docker ps -q)

#run new image
docker run -d -p 8000:8000 333082661382.dkr.ecr.us-west-1.amazonaws.com/status_page_image:$tag
