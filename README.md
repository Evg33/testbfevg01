"# testbfevg01" 
git clone https://github.com/Evg33/testbfevg01.git .
docker build -t evgtestbf .
docker run -d -p 80:8080 evgtestbf
http://host/hello-1.0
