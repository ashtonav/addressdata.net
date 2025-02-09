cd src
echo "Starting on localhost:8001. It may take a bit of time..."
docker run -p 8001:8001 -it $(docker build -q .) 
