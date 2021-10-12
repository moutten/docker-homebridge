FROM ubuntu:20.04
LABEL maintainer="Matt Outten <matt@outten.net>"

# Install Supporting Packages
RUN export DEBIAN_FRONTEND="noninteractive" && \
  export TZ="America/New_York" && \
  apt-get -q update && apt-get install -qy gnupg curl && \
  curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
  apt-get -q update && \
  apt-get install -qy \
    build-essential \
    curl \
    git \
    libavahi-compat-libdnssd-dev \
    locales \
    nodejs \
    python && \
  apt-get -q clean && \
  rm -rf /var/lib/apt/lists/* && \
  localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
  ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
  dpkg-reconfigure --frontend noninteractive tzdata

RUN npm install --unsafe-perm -g homebridge homebridge-indigo homebridge-nest && \
  mkdir -p /config && \
  cp /usr/lib/node_modules/homebridge-indigo/sampleconfig.json /config/config.json

COPY run.sh /run.sh

RUN chmod +x /run.sh && mkdir -p /var/run/dbus

VOLUME /config

CMD ["/run.sh"]
