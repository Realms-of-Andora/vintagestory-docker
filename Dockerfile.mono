FROM alpine:latest
ARG VERSION="1.18.1"
ENV VERSION=$VERSION

RUN mkdir /vintagestory \
 && apk --no-cache add ca-certificates wget \
 && wget "https://cdn.vintagestory.at/gamefiles/stable/vs_server_${VERSION}.tar.gz" \
 && tar xf "vs_server_${VERSION}.tar.gz" --directory vintagestory
ADD . /vintagestory

FROM mono:latest
RUN mkdir /vintagestory \
 && mkdir /vintagestory-files
WORKDIR /vintagestory
COPY --from=0 /vintagestory .
RUN cert-sync /etc/ssl/certs/ca-certificates.crt
CMD [ "mono",  "./VintagestoryServer.exe" ]
