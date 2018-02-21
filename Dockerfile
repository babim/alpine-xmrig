FROM  babim/alpinebase
RUN   apk --no-cache upgrade && \
      apk --no-cache add \
        git \
        cmake \
        libuv-dev \
        libmicrohttpd-dev \
        build-base && \
      git clone https://github.com/xmrig/xmrig && mv xmrig xmrig-dev && \
      cd xmrig-dev && cmake -DCMAKE_BUILD_TYPE=Release . && \
      make && mv xmrig / && cd ../ && rm -rf xmrig-dev && \
      apk del \
        build-base \
        cmake \
        git
USER root
WORKDIR    /
ENTRYPOINT  ["./xmrig", "--donate-level=1"]
