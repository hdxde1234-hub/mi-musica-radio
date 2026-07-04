FROM savonet/liquidsoap:v2.1.4

WORKDIR /music

# Copiamos tus canciones y el archivo de la radio
COPY --chown=liquidsoap:liquidsoap . /music

# Arrancamos la radio directo. ¡Sin instalar mrdas de llaves vencidas!
CMD ["liquidsoap", "/music/radio.liq"]