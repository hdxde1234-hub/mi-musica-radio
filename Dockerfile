FROM savonet/liquidsoap:v2.1.4
WORKDIR /music
COPY --chown=liquidsoap:liquidsoap . /music
CMD ["liquidsoap", "/music/radio.liq"]
