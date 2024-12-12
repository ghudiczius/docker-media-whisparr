FROM mcr.microsoft.com/dotnet/runtime:9.0

ARG VERSION

# renovate: release=bullseye depName=curl
ENV CURL_VERSION=7.88.1-10+deb12u8
# renovate: release=bullseye depName=libsqlite3-0
ENV LIBSQLITE3_VERSION=3.40.1-2+deb12u1

RUN apt-get update && \
    apt-get --assume-yes --quiet install \
        curl="${CURL_VERSION}" \
        libsqlite3-0="${LIBSQLITE3_VERSION}" && \
    groupadd --gid=1000 whisparr && \
    useradd --gid=1000 --home-dir=/opt/whisparr --no-create-home --shell /bin/bash --uid 1000 whisparr && \
    mkdir /config /downloads /xxx /opt/whisparr && \
    curl --location --output /tmp/whisparr.tar.gz "https://whisparr.servarr.com/v1/update/nightly/updatefile?os=linux&runtime=netcore&arch=x64" && \
    tar xzf /tmp/whisparr.tar.gz --directory=/opt/whisparr --strip-components=1 && \
    chown --recursive 1000:1000 /config /downloads /xxx /opt/whisparr && \
    rm /tmp/whisparr.tar.gz

USER 1000
VOLUME /config /downloads /xxx
WORKDIR /opt/whisparr

EXPOSE 7878
CMD ["/opt/whisparr/Whisparr", "-data=/config", "-nobrowser"]
