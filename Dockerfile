# Pull base image from official repo
FROM openjdk:8

# Configure desired timezone
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y icedtea-netx

CMD javaws https://club.sportlink.com/apps/club-production/knvb.jnlp
