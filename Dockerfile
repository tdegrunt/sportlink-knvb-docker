# Pull base image from official repo
FROM openjdk:8-jre

# Configure desired timezone
ENV TZ=Europe/Amsterdam
ENV _JAVA_OPTIONS='-Dsun.java2d.xrender=false'
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# Parameters for default user:group
ARG uid=1000
ARG user=sportlink
ARG gid=1000
ARG group=sportlink

# Add or modify user and group for build and runtime (convenient)
RUN id ${user} > /dev/null 2>&1 \
    && { groupmod -g "${gid}" "${group}" && usermod -md /home/${user} -s /bin/bash -g "${group}" -u "${uid}" "${user}"; } \
    || { groupadd -g "${gid}" "${group}" && useradd -md /home/${user} -s /bin/bash -g "${group}" -u "${uid}" "${user}"; }


RUN apt-get update \
    && apt-get install -y icedtea-netx \
    && apt-get clean

# Switch to non-root user
USER ${user}
WORKDIR /home/${user}

CMD javaws https://club.sportlink.com/apps/club-production/knvb.jnlp
