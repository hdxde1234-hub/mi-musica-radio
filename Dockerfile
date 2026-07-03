FROM savonet/liquidsoap:v2.1.4
USER root
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*
COPY --chown=liquidsoap:liquidsoap . /music
USER liquidsoap
CMD liquidsoap 'output.icecast(%mp3, host="'"$STREAM_HOST"'", port='$STREAM_PORT', password="'"$STREAM_PASSWORD"'", mount="/stream", playlist.safe("/music"))'
