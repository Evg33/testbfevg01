"# testbfevg01" 
git clone https://github.com/Evg33/testbfevg01.git .
git pull
docker build -t evg33/evgtestbf -t evg33/evgtestbf:1.0.2 .
#docker login
docker push evg33/evgtestbf
docker run -d -p 80:8080 evgtestbf
http://host/hello-1.0
