# docker-ethminer

This is a docker harness for running an nVidia CUDA GPU miner.

There is an example of running four separate miners in the `docker-compose.yml` file as well.

This works with both `x86_64` and `ppc64le` architecture hosts with nVidia GPUs.

# Dependencies:

Make sure you have `nvidia-docker` installed first.

The primary reason is the creation of the `nvidia_driver_384.81` volume.

Your installed nvidia driver version may differ from `384.81`.

# usage:

If you have `nvidia-docker` v1, use `docker-compose`

Alternatively, if you have `vidia-docker` v2, use `make`

# docker-compose (vmware-docker v1)

Edit `docker-compose.yml` to:

- Replace the `384.81` with your currently installed nvidia driver version.
- Replace `2c0859b9312d9bf93e1b4cae8d47d59030a75a9f` with your own ethereum address.

Then run:

    ARCH=$(uname -p) docker-compose up -d

# make (vmware-docker v2)

No need to edit anything. Just run:

    make ARCH=$(uname -p)



