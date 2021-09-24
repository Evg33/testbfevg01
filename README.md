```
====
git clone --branch dev  https://github.com/Evg33/testbfevg01.git .

====
git pull
docker build -t evgtestbf .
docker run -d -p 80:8080 evgtestbf
http://host/hello-1.0

====
docker login
docker image tag evgtestbf evg33/evgtestbf
docker push evg33/evgtestbf
docker build -t evg33/evgtestbf -t evg33/evgtestbf:1.0.3 .
docker pull evg33/evgtestbf:latest

```
