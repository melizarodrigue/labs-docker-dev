# output  

@melizarodrigue ➜ /workspaces/labs-docker-dev (main) $ docker pull nginx
Using default tag: latest
latest: Pulling from library/nginx
efc2b5ad9eec: Pull complete 
8fe9a55eb80f: Pull complete 
045037a63be8: Pull complete 
7111b42b4bfa: Pull complete 
3dfc528a4df9: Pull complete 
9e891cdb453b: Pull complete 
0f11e17345c5: Pull complete 
Digest: sha256:6af79ae5de407283dcea8b00d5c37ace95441fd58a8b1d2aa1ed93f5511bb18c
Status: Downloaded newer image for nginx:latest
docker.io/library/nginx:latest

# output 
@melizarodrigue ➜ /workspaces/labs-docker-dev (main) $ docker run -d -p 8080:80 nginx
c7de60b8b5aaa6288ba2b97d5a6e25434e19247c02aae1193e63f8809ca2ae21

# output
@melizarodrigue ➜ /workspaces/labs-docker-dev (main) $ docker run -it ubuntu bash
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
9c704ecd0c69: Pull complete 
Digest: sha256:2e863c44b718727c860746568e1d54afd13b2fa71b160f5cd9058fc436217b30
Status: Downloaded newer image for ubuntu:latest
root@8edbc9b23f97:/# 

# output
@melizarodrigue ➜ /workspaces/labs-docker-dev (main) $ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS                       PORTS                                   NAMES
8edbc9b23f97   ubuntu    "bash"                   3 minutes ago   Exited (127) 9 seconds ago                                           jolly_boyd
c7de60b8b5aa   nginx     "/docker-entrypoint.…"   5 minutes ago   Up 5 minutes                 0.0.0.0:8080->80/tcp, :::8080->80/tcp   eager_kilby
@melizarodrigue ➜ /workspaces/labs-docker-dev (main) $ docker rm 8edbc9b23f97
8edbc9b23f97


@melizarodrigue ➜ /workspaces/labs-docker-dev (main) $ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                                   NAMES
c7de60b8b5aa   nginx     "/docker-entrypoint.…"   6 minutes ago   Up 6 minutes   0.0.0.0:8080->80/tcp, :::8080->80/tcp   eager_kilby


@melizarodrigue ➜ /workspaces/labs-docker-dev (main) $ 

# output docker build
@melizarodrigue ➜ /workspaces/labs-docker-dev (main) $ docker build -t ubuntu-updated:latest .
[+] Building 24.3s (9/9) FINISHED                                                                               docker:default
 => [internal] load build definition from dockerfile                                                                      0.2s
 => => transferring dockerfile: 562B                                                                                      0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                                          0.0s
 => [internal] load .dockerignore                                                                                         0.1s
 => => transferring context: 2B                                                                                           0.0s
 => [1/4] FROM docker.io/library/ubuntu:latest                                                                            0.1s
 => [internal] load build context                                                                                         0.3s
 => => transferring context: 43.33kB                                                                                      0.0s
 => [2/4] RUN apt-get update && apt-get install -y     curl     wget     vim     && apt-get clean                        21.5s
 => [3/4] WORKDIR /app                                                                                                    0.2s
 => [4/4] COPY . /app                                                                                                     0.3s
 => exporting to image                                                                                                    1.4s
 => => exporting layers                                                                                                   1.3s
 => => writing image sha256:f8f1426861218c31c7eb4becce690a771c9f957a1d8b0a13c87c86be279a6fa1                              0.0s
 => => naming to docker.io/library/ubuntu-updated:latest  