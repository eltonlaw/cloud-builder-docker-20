FROM gcr.io/gcp-runtimes/ubuntu_20_0_4 AS base

ARG DOCKER_PKG_VERSION=5:20.10.12~3-0~ubuntu-focal

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        make \
        software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get -y update \
    && apt-get -y install docker-ce=${DOCKER_PKG_VERSION} \
      docker-ce-cli=${DOCKER_PKG_VERSION}

FROM base AS showpkg
CMD ["apt-cache", "showpkg", "docker-ce"]

FROM base AS docker
ENV DOCKER_BUILDKIT=1
ENTRYPOINT ["/usr/bin/docker"]
