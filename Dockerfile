FROM alpine:3.15.0

RUN apk add --no-cache ffmpeg python3 curl bash &&\
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp &&\
    chmod a+rx /usr/local/bin/yt-dlp

VOLUME [/config /downloads]

WORKDIR /app

COPY download.sh /app/

WORKDIR /downloads

#ENTRYPOINT [ "/bin/bash" ]
ENTRYPOINT ["bash","/app/download.sh" ]
