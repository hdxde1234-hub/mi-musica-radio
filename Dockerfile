FROM savonet/liquidsoap:v2.1.4
COPY --chown=liquidsoap:liquidsoap . /music
ENTRYPOINT ["liquidsoap"]
CMD ["-e", "output.icecast(%mp3, host=env(\"STREAM_HOST\"), port=int_of_string(env(\"STREAM_PORT\")), password=env(\"STREAM_PASSWORD\"), mount=\"/stream\", playlist.safe(\"/music\"))"]
