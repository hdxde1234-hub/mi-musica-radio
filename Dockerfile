FROM savonet/liquidsoap:v2.1.4
COPY --chown=liquidsoap:liquidsoap . /music
CMD liquidsoap 'output.icecast(%mp3, host="'"$STREAM_HOST"'", port='$STREAM_PORT', password="'"$STREAM_PASSWORD"'", mount="/stream", playlist.safe("/music"))'
