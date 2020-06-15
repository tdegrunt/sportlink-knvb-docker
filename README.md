# sportlink-knvb-docker
Docker image for running knvb.jnlp

```
git clone https://github.com/vrolijken/sportlink-knvb-docker.git
docker build --tag sportlink:1.0 .
docker run --rm --net=host --env="DISPLAY" \
  --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
  --volume="$(pwd)/cache:/home/sportlink/.cache/icedtea-web" \
  --volume="$(pwd)/config:/home/sportlink/.config/icedtea-web" \
  sportlink:1.0

```