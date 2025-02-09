# Build image
FROM mcr.microsoft.com/powershell AS build-image
# 1. Install dependencies on build image
RUN apt update -y
RUN apt install python3-pip -y
RUN pip3 install sqlite-utils
# 2. Initialize databases for datasette from csv
WORKDIR build
COPY . .
RUN pwsh ./initialize-databases.ps1
# 3. Cleanup, we don't need csv folder anymore
RUN rm -r csv

# Final image
FROM datasetteproject/datasette:0.65.1 AS final-image
# 3. Install dependencies on final image
RUN pip install datasette-cluster-map
# 4. Copy files over from build image
WORKDIR app
COPY --from=build-image build .
# 5. Run it
RUN chmod +x run-entrypoint.sh
EXPOSE 8001
ENTRYPOINT ["./run-entrypoint.sh"]