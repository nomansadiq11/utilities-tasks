#!/bin/bash
name='test'
if [ "$(docker ps -q -f name=$name)" ]; then

    
    docker stop container $name
    docker rm $name
    docker pull nomansadiq11/ubuntu-nginx-nodejs
	docker run -it -d --name $name nomansadiq11/ubuntu-nginx-nodejs
    # docker ps
        
fi