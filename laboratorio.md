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

 # Construir
 @melizarodrigue ➜ /workspaces/labs-docker-dev (main) $ docker build -t my-nginx:latest .
[+] Building 12.6s (6/6) FINISHED                                                                               docker:default
 => [internal] load build definition from dockerfile                                                                      0.0s
 => => transferring dockerfile: 877B                                                                                      0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                                          0.0s
 => [internal] load .dockerignore                                                                                         0.0s
 => => transferring context: 2B                                                                                           0.0s
 => CACHED [stage-1 1/2] FROM docker.io/library/ubuntu:latest                                                             0.0s
 => [stage-1 2/2] RUN apt-get update &&     apt-get install -y nginx &&     apt-get clean                                11.6s
 => exporting to image                                                                                                    0.5s
 => => exporting layers                                                                                                   0.4s
 => => writing image sha256:11c1ebac2863959f0f5fae0515ae095e7a27d6cd732328b14892d405f59f7cc9                              0.0s
 => => naming to docker.io/library/my-nginx:latest 

 # Ejecutar
 @melizarodrigue ➜ /workspaces/labs-docker-dev (main) $ docker run -d -p 80:80 my-nginx:latest
4d637143a6a5f18dbced4b91dd1346a08ce321fe068528b7bfb5abec30c44f2d

# Reconstruir
@melizarodrigue ➜ /workspaces/labs-docker-dev (main) $ docker build -t my-nginx:latest .
[+] Building 12.1s (6/6) FINISHED                                                                                            docker:default
 => [internal] load build definition from dockerfile                                                                                   0.0s
 => => transferring dockerfile: 990B                                                                                                   0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                                                       0.0s
 => [internal] load .dockerignore                                                                                                      0.1s
 => => transferring context: 2B                                                                                                        0.0s
 => CACHED [stage-2 1/2] FROM docker.io/library/ubuntu:latest                                                                          0.0s
 => [stage-2 2/2] RUN apt-get update && apt-get install -y nginx                                                                      11.1s
 => exporting to image                                                                                                                 0.5s
 => => exporting layers                                                                                                                0.4s
 => => writing image sha256:683d4be580c2380de9a84891703d3cff08a84812f26e5179588606154887eed7                                           0.0s
 => => naming to docker.io/library/my-nginx:latest 

 # Workdir
 @melizarodrigue ➜ /workspaces/labs-docker-dev (main) $ docker build -t my-nginx:latest .
[+] Building 1.3s (9/9) FINISHED                                                                                             docker:default
 => [internal] load build definition from dockerfile                                                                                   0.0s
 => => transferring dockerfile: 385B                                                                                                   0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                                                       0.0s
 => [internal] load .dockerignore                                                                                                      0.1s
 => => transferring context: 2B                                                                                                        0.0s
 => [1/4] FROM docker.io/library/ubuntu:latest                                                                                         0.0s
 => [internal] load build context                                                                                                      0.0s
 => => transferring context: 31B                                                                                                       0.0s
 => CACHED [2/4] RUN apt-get update &&     apt-get install -y nginx &&     apt-get clean                                               0.0s
 => CACHED [3/4] WORKDIR /app                                                                                                          0.0s
 => [4/4] COPY myfile.txt .                                                                                                            0.2s
 => exporting to image                                                                                                                 0.6s
 => => exporting layers                                                                                                                0.4s
 => => writing image sha256:627d5ac745c5893459b046fed9f57591bf2f2230e2ff93c58058aec876da125f                                           0.0s
 => => naming to docker.io/library/my-nginx:latest   

 # script Python
 @melizarodrigue ➜ /workspaces/labs-docker-dev (main) $ docker build -t my-nginx:latest .
[+] Building 26.7s (9/9) FINISHED                                                                                            docker:default
 => [internal] load build definition from dockerfile                                                                                   0.1s
 => => transferring dockerfile: 111B                                                                                                   0.0s
 => [internal] load metadata for docker.io/library/python:3.9                                                                          0.7s
 => [auth] library/python:pull token for registry-1.docker.io                                                                          0.0s
 => [internal] load .dockerignore                                                                                                      0.1s
 => => transferring context: 2B                                                                                                        0.0s
 => [1/3] FROM docker.io/library/python:3.9@sha256:65438c2e26dbf9f5db4b5553e332747fa20722c1b7c7ccc6f8480396ff4186db                   22.6s
 => => resolve docker.io/library/python:3.9@sha256:65438c2e26dbf9f5db4b5553e332747fa20722c1b7c7ccc6f8480396ff4186db                    0.1s
 => => sha256:65438c2e26dbf9f5db4b5553e332747fa20722c1b7c7ccc6f8480396ff4186db 10.35kB / 10.35kB                                       0.0s
 => => sha256:9972540d93856f9ca3eff2cf803ffb472bf1687cd1a91365cc803a539281900b 2.52kB / 2.52kB                                         0.0s
 => => sha256:83a59ab1a4811d0d1b135849e5071eff4d461a56def17589bd1b2f093aeeb5a1 7.31kB / 7.31kB                                         0.0s
 => => sha256:ca4e5d6727252f0dbc207fbf283cb95e278bf562bda42d35ce6c919583a110a0 49.55MB / 49.55MB                                       1.0s
 => => sha256:30b93c12a9c9326732b35d9e3ebe57148abe33f8fa6e25ab76867410b0ccf876 24.05MB / 24.05MB                                       0.7s
 => => sha256:10d643a5fa823cd013a108b2076f4d2edf1b2a921f863b533e83ea5ed8d09bd4 64.14MB / 64.14MB                                       1.3s
 => => extracting sha256:ca4e5d6727252f0dbc207fbf283cb95e278bf562bda42d35ce6c919583a110a0                                              2.2s
 => => sha256:d6dc1019d7935fe82827434da11bf96cf14e24979f8155e73b794286f10b7f05 211.24MB / 211.24MB                                     6.4s
 => => sha256:c7d45ab0573c09f3315112fe3e8d273f4b54dab9e8c3f315810afb743e794a28 6.16MB / 6.16MB                                         1.6s
 => => sha256:564d1c451ea70670b349d1250f5c0577416f873f6ee7b5cb33dafeb21c2c40a4 15.82MB / 15.82MB                                       1.7s
 => => sha256:ddfb50ba1977e47749619886799b60da9f2a856fca3270ccb051d2f326489bd5 233B / 233B                                             1.8s
 => => sha256:91b87d81d4c8d2b201b71e0a5b07fe01ea4e6d1be30cdc8c30f96653b6663df3 2.70MB / 2.70MB                                         1.9s
 => => extracting sha256:30b93c12a9c9326732b35d9e3ebe57148abe33f8fa6e25ab76867410b0ccf876                                              0.8s
 => => extracting sha256:10d643a5fa823cd013a108b2076f4d2edf1b2a921f863b533e83ea5ed8d09bd4                                              2.5s
 => => extracting sha256:d6dc1019d7935fe82827434da11bf96cf14e24979f8155e73b794286f10b7f05                                              6.8s
 => => extracting sha256:c7d45ab0573c09f3315112fe3e8d273f4b54dab9e8c3f315810afb743e794a28                                              0.3s
 => => extracting sha256:564d1c451ea70670b349d1250f5c0577416f873f6ee7b5cb33dafeb21c2c40a4                                              0.6s
 => => extracting sha256:ddfb50ba1977e47749619886799b60da9f2a856fca3270ccb051d2f326489bd5                                              0.0s
 => => extracting sha256:91b87d81d4c8d2b201b71e0a5b07fe01ea4e6d1be30cdc8c30f96653b6663df3                                              0.3s
 => [internal] load build context                                                                                                      0.1s
 => => transferring context: 30B                                                                                                       0.0s
 => [2/3] WORKDIR /app                                                                                                                 0.2s
 => [3/3] COPY script.py .                                                                                                             0.3s
 => exporting to image                                                                                                                 2.3s
 => => exporting layers                                                                                                                2.1s
 => => writing image sha256:d96357cdfd73ab7f20098aac8ef5c77d23c4cb4a5224a1c54009209b40fcad8c                                           0.0s
 => => naming to docker.io/library/my-nginx:latest  