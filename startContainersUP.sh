#!/bin/bash

FileDocker=DockerRundeck.yml
FilePodman=podmanPostgres.yml

echo "A criar containers do rundeck c/ Docker e Postgres c/ Podman..."

# vamos garantir que DB fica pronta primeiro pq Rundeck depende dela (usei sleep, podia ter arranjado algo mais consistente e que n fosse fixo, mas n preciso de consistencia nem rapidez).
podman-compose -f $FilePodman up -d
sleep 7 

docker compose -f $FileDocker up -d

echo "Ambos containers criados. Podes ligar-te pelo browser: http://127.0.0.1:7890"
