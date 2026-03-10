#!/bin/bash

FileDocker=DockerRundeck.yml
FilePodman=podmanPostgres.yml

echo "A parar e eliminar containers do Rundeck c/ Docker e Postgres c/ Podman..."

podman-compose -f $FilePodman down
docker compose -f $FileDocker down

echo "Ambos containers eliminados"
