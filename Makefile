# This Makefile works with nvidia-docker v2

ARCH:=x86_64

all: clean
	nvidia-docker build -t sofwerx/ethminer:$(ARCH) -f Dockerfile.$(ARCH) .
	nvidia-docker run --restart=always -d --name ethminer --log-driver json-file  --log-opt mode=non-blocking --log-opt max-buffer-size=4m -e GPU_FORCE_64BIT_PTR=0 -e GPU_MAX_HEAP_SIZE=100 -e GPU_USE_SYNC_OBJECTS=1 -e GPU_MAX_ALLOC_PERCENT=100 -e GPU_SINGLE_ALLOC_PERCENT=100 sofwerx/ethminer:$(ARCH) /ethminer/build/ethminer/ethminer --cuda-parallel-hash 8 --farm-recheck 200 -U -S us1.ethermine.org:4444 -FS us2.ethermine.org:4444 -O 2c0859b9312d9bf93e1b4cae8d47d59030a75a9f.popos

clean:
	nvidia-docker stop ethminer || true
	nvidia-docker rm -f ethminer || true
