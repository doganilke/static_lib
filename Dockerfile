

FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive # ignore user input required
# Install required build dependencies
RUN apt-get -y update && apt-get install -y
RUN apt-get -y install g++ cmake git
RUN  apt-get install -y libgtest-dev 
RUN cd /usr/src/googletest && \
    cmake . && \
    cmake --build . --target install
COPY . .
WORKDIR .
# Run cmake configure & build process
RUN mkdir ./build
RUN cmake -B/build -S . -D CMAKE_BUILD_TYPE=Release
RUN cmake --build /build
# Launch built application
CMD ["./build/cppdocker_run"]
CMD ["./build/test/test_pro"]
