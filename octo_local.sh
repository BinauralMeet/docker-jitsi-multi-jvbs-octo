#! /bin/bash

# create env from example (don't use gen-passwords.sh)
cp env.example .env

# build local docker images
cd jvb
docker build -f Dockerfile -t hasemeet/jvb:v2 .

cd ../jicofo
docker build -f Dockerfile -t hasemeet/jicofo:v2 .

cd ..
docker-compose up -d

cd jvb2_octo
cp env.example .env
docker-compose up -d

echo "Done!, please check your https://localhost:8443"
