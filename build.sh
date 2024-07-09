#!/bin/bash

# Get the container ID(s) for the ancestor image 'docuseal-app'
container_ids=$(docker container ps -q --filter ancestor=docuseal-app)

# Stop the container(s) if any are found
if [ -n "$container_ids" ]; then
  docker container stop $container_ids
  docker container rm $container_ids
  
else
  echo "No running containers found for ancestor 'docuseal-app'."
fi

docker build -t docuseal-app:latest .
Home=localhost docker compose up