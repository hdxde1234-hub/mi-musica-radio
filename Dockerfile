FROM alpine:3.18
RUN apk add --no-cache liquidsoap ffmpeg
COPY . /music
CMD liquidsoap 'output.icecast(%mp3, host="'"$STREAM_HOST"'", port='$STREAM_PORT', password="'"$STREAM_PASSWORD"'", mount="/stream", playlist.safe("/music"))'
