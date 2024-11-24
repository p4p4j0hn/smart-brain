FROM debian:bookworm

ENV LANG="C.UTF-8"

# Install basic build tools
RUN apt-get update \
  && apt-get upgrade -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  sudo \
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

# Install bash-preexec
RUN curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o /usr/share/bash-prexec

# Default to bash shell
ENV SHELL=/bin/bash \
  DOCKER_BUILDKIT=1

# Remove scripts now that we're done with them
RUN apt-get clean -y && rm -rf /tmp/scripts

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

ARG USERNAME=coder

RUN groupadd --gid 1000 $USERNAME \
  && useradd -s /bin/bash --uid 1000 --gid 1000 -m $USERNAME \
  && if ! [ -d /etc/sudoers.d ]; then mkdir /etc/sudoers.d; fi \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME

USER coder

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "sleep", "infinity" ]
