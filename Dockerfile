FROM savonet/liquidsoap:v2.1.4

USER root
# Creamos un script rápido que genera la página web en el puerto correcto
RUN echo 'import http.server, socketserver, os; PORT = int(os.environ.get("PORT", 10000)); handler = lambda *args: http.server.SimpleHTTPRequestHandler(*args, directory="/music"); http.server.ThreadingHTTPServer(("0.0.0.0", PORT), handler).serve_forever()' > /web.py

WORKDIR /music
COPY --chown=liquidsoap:liquidsoap . /music

# Creamos un archivo HTML básico para que responda a los pings
RUN echo '<h1>📻 Radio Activa 24/7 en linea y escuchando pings!</h1>' > /music/index.html

USER liquidsoap

# El comando mágico: arranca la web con Python de fondo y luego arranca tu radio
CMD python3 /web.py & liquidsoap /music/radio.liq
