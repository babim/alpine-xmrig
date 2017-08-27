FROM  babim/ubuntubase
RUN   apt-get update && apt-get install -y git build-essential cmake libuv1-dev nvidia-cuda-dev nvidia-cuda-toolkit
RUN   git clone https://github.com/xmrig/xmrig-nvidia.git && mv xmrig-proxy xmrig-nvidia-dev && \
      cd xmrig-nvidia-dev && mkdir build && cd build && \
      cmake .. -DCMAKE_C_COMPILER=gcc-5 -DCMAKE_CXX_COMPILER=g++-5 && \
      make && mv xmrig-nvidia / && cd ../../ && rm -rf xmrig-nvidia-dev
RUN   apt-get purge -y git build-essential cmake && rm -rf /var/lib/apt/lists/**
WORKDIR    /
ENTRYPOINT ["./xmrig-nvidia"]
