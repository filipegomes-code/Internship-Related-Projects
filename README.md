# Internship Project: Rundeck + PostgreSQL with Hybrid Container Setup

This Mini project implements **Rundeck** using Docker and **Postgres** using Podman.
The structure of the project is as following:
 - **PostgreSQL** running on **Podman** (rootless VM - default one) with iSCSI storage from TrueNAS
 - **Rundeck** running on **Docker** (due to arm64 compatibility issues)
 - Cross-engine communication (exposing a port in the host machine - port mapping) and 'host.docker.internal' (host IP)

## Result
 - Persistent database storage even if container goes down, the jobs are still "alive" -> because of volumes mounted on a virtual disk over the network 


For more detailed information, check the .pdf (working on it)
