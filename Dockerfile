FROM golang:alpine AS build

WORKDIR /
COPY waitForIpfs.go waitForIpfs.go
RUN CGO_ENABLED=0 go build waitForIpfs.go

FROM ipfs/go-ipfs

USER root

COPY --from=build waitForIpfs /bin/waitForIpfs
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/bin/sh" ]
CMD [ "/entrypoint.sh" ]