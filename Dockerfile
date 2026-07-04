FROM savonet/liquidsoap:v2.1.4

USER root
# Creamos la mini página web con Python
RUN echo 'import http.server, socketserver, os; PORT = int(os.environ.get("PORT", 10000)); handler = lambda *args: http.server.SimpleHTTPRequestHandler(*args, directory="/music"); http.server.ThreadingHTTPServer(("0.0.0.0", PORT), handler).serve_forever()' > /web.py

WORKDIR /music
COPY --chown=liquidsoap:liquidsoap . /music

# El mensaje bonito que van a leer UptimeRobot y Cron-job
RUN echo '<h1>📻 Radio Activa 24/7 en linea y escuchando pings!</h1>' > /music/index.html

USER liquidsoap

# Usamos la consola limpia de Linux para arrancar la web de fondo y luego la radio
CMD ["sh", "-c", "python3 /web.py & liquidsoap /music/radio.liq"]
