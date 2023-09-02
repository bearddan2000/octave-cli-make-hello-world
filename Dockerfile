FROM alpine:edge

RUN adduser -D developer

ENV DISPLAY :0

RUN apk update \
    && apk add octave make

RUN apk --no-cache add msttcorefonts-installer fontconfig && \
    update-ms-fonts && \
    fc-cache -f

USER developer

WORKDIR /home/developer

COPY bin .

CMD ["make"]