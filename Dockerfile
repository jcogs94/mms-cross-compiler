# Use arm32v7 Debian Bullseye as the base image
FROM arm32v7/debian:bullseye

# Install compiler tools
RUN apt-get update && apt-get install -y \
    build-essential gcc g++ make liblog4cxx-dev \
    nlohmann-json3-dev libcrypto++-dev libpugixml-dev \
    libmodbus-dev sqlite3 libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Include the tar files that the individual modules need for dependencies
WORKDIR /
COPY ./dependencies/vm.tar vm.tar
RUN tar -xvf vm.tar && rm vm.tar

# Set where to run the compilation
WORKDIR /mms

# Call gcc when the container runs
ENTRYPOINT ["make"]

