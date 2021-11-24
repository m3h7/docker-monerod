FROM debian:10
LABEL MAINTANER mahiso
LABEL org.opencontainers.image.source https://github.com/m3h7/docker-monerod

ARG MONERO_RELEASE
ENV MONERO_RELEASE $MONERO_RELEASE

RUN set -e && \
    apt-get update -q -y --no-install-recommends && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -q -y --no-install-recommends \
    ca-certificates gpg gpg-agent dirmngr curl bzip2 && \
    apt-get clean

RUN curl -O https://raw.githubusercontent.com/monero-project/monero/master/utils/gpg_keys/binaryfate.asc &&\
    gpg --keyid-format long --with-fingerprint binaryfate.asc | grep '81AC 591F E9C4 B65C 5806  AFC3 F0AF 4D46 2A0B DF92' &&\
    gpg --import binaryfate.asc &&\
    curl -L -O https://getmonero.org/downloads/hashes.txt && gpg --verify hashes.txt &&\
    curl https://downloads.getmonero.org/cli/monero-linux-x64-$MONERO_RELEASE.tar.bz2 -O &&\
    grep "monero-linux-x64-$MONERO_RELEASE.tar.bz2" hashes.txt | sha256sum -c - &&\
    tar -xjvf monero-linux-x64-$MONERO_RELEASE.tar.bz2 && cp monero-x86_64-linux-gnu-$MONERO_RELEASE/* /usr/local/bin &&\
    rm -rf monero-linux-x64-$MONERO_RELEASE.tar.bz2 monero-x86_64-linux-gnu-$MONERO_RELEASE binaryfate.asc hashes.txt

RUN groupadd -r monero -g 1000 && \
    useradd -u 1000 -r -g monero -s /sbin/nologin -c "monero node user" monero
RUN mkdir -p /home/monero/.bitmonero && \
    chown monero.monero /home/monero /home/monero/.bitmonero
USER monero

EXPOSE 18080 18081 18083 18089

VOLUME /home/monero/.bitmonero

WORKDIR /home/monero
ENTRYPOINT ["/usr/local/bin/monerod"]
