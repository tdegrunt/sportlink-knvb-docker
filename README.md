# sportlink-knvb-docker
Docker image for running knvb.jnlp

Running sportlink requires several outdated technologies. This docker image will run it. It is assumed 
that the host is Linux, for it will use the X-windows to show sportlink.

To run, follow the commands below:

```
git clone https://github.com/vrolijken/sportlink-knvb-docker.git
cd sportlink-knvb-docker
docker build --tag sportlink:1.0 .
docker run --rm --net=host --env="DISPLAY" \
  --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
  --volume="$(pwd)/cache:/home/sportlink/.cache/icedtea-web" \
  --volume="$(pwd)/config:/home/sportlink/.config/icedtea-web" \
  sportlink:1.0

```