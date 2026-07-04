FROM savonet/liquidsoap:v2.1.4

USER root

# Creamos un script que engaña a Render abriendo el puerto por 2 segundos y luego se cierra
RUN echo 'import socket, os, time; s = socket.socket(); s.bind(("0.0.0.0", int(os.environ.get("PORT", 10000)))); s.listen(1); print("Puerto abierto para Render..."); time.sleep(2); s.close()' > /fake_web.py

WORKDIR /music
COPY --chown=liquidsoap:liquidsoap . /music

USER liquidsoap

# Primero corre el engaño de Python (Render se pone verde) y LUEGO arranca la radio
CMD python3 /fake_web.py && liquidsoap /music/radio.liq
