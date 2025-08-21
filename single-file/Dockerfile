# Use arm32v7 Debian Bullseye as the base image
FROM arm32v7/debian:bullseye

# Install compiler tools
RUN apt-get update && apt-get install -y \
    build-essential gcc g++ make \
    && rm -rf /var/lib/apt/lists/*

# Set where to run the compilation
WORKDIR /mms

# Call gcc when the container runs
ENTRYPOINT ["gcc"]

