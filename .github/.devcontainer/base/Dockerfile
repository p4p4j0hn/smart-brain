FROM debian:bookworm

ENV LANG="C.UTF-8"

# Install basic build tools
RUN apt-get update \
  && apt-get upgrade -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  make \
  unzip \
  build-essential \
  # Required for PostgreSQL
  libpq-dev \
  # Required for ts
  moreutils \
  rsync \
  zip \
  libgdiplus \
  jq \
  software-properties-common \
  curl \
  gettext \
  inotify-tools \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get update \
  && apt-get upgrade -y \
  && rm -rf /var/lib/apt/lists/*

# Default to bash shell
ENV SHELL=/bin/bash \
  DOCKER_BUILDKIT=1

# Remove scripts now that we're done with them
RUN apt-get clean -y && rm -rf /tmp/scripts

COPY ./docker-entrypoint.sh /usr/local/share/docker-entrypoint.sh

ENTRYPOINT [ "/usr/local/share/docker-entrypoint.sh" ]

CMD [ "sleep", "infinity" ]
