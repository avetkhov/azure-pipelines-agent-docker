FROM avetkhov/flutter:latest

ENV TARGETARCH=linux-x64
ENV AGENT_DOWNLOAD_BASE_URL=https://aka.ms/InstallAzureCLIDeb

RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        apt-transport-https apt-utils ca-certificates curl git iputils-ping \
        jq lsb-release software-properties-common

RUN curl -sL ${AGENT_DOWNLOAD_BASE_URL} | bash

WORKDIR /azp

COPY ./start.sh .
RUN chmod +x start.sh

ENTRYPOINT [ "./start.sh" ]