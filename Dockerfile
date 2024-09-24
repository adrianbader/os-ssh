FROM alpine:3

RUN apk update && \
    apk add --no-cache \
    bash \
    openssh \
    rsync \
    python3

RUN adduser -D -u 1001 -h /tmp/jigglypuff jigglypuff

USER 1001

COPY sshdconfig /tmp/sshd/config/
COPY home /tmp/

EXPOSE 62222

WORKDIR /tmp/jigglypuff

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]

#CMD ["/usr/sbin/sshd", "-D", "-f","/tmp/sshd/config/sshd_config"]