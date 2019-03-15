FROM ubuntu:18.04
LABEL maintainer="Matt Outten <matt@outten.net>"

# Install Supporting Packages
RUN apt-get -q update && apt-get install -qy gnupg curl && \
  curl -sfL https://deb.nodesource.com/setup_8.x | bash - && \
  apt-get -q update && \
  apt-get install -qy \
    build-essential \
    curl \
    git \
    libavahi-compat-libdnssd-dev \
    nodejs \
    python && \
  apt-get -q clean && \
  rm -rf /var/lib/apt/lists/*

RUN npm install --unsafe-perm -g homebridge && \
  npm install --unsafe-perm -g homebridge-indigo && \
  mkdir -p /config && \
  cp /usr/lib/node_modules/homebridge-indigo/sampleconfig.json /config/config.json

COPY run.sh /run.sh

RUN chmod +x /run.sh && mkdir -p /var/run/dbus

VOLUME /config

CMD ["/run.sh"]
