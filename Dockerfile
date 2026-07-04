FROM savonet/liquidsoap:v2.1.4

USER root

# Instalamos supervisor para correr dos cosas a la vez de verdad
RUN apt-get update && apt-get install -y supervisor

# Creamos la mini página web que Railway quiere ver activa todo el tiempo
RUN echo 'import http.server, os; PORT = int(os.environ.get("PORT", 8080)); http.server.ThreadingHTTPServer(("0.0.0.0", PORT), lambda *args: http.server.SimpleHTTPRequestHandler(*args, directory="/music")).serve_forever()' > /web.py

WORKDIR /music
COPY --chown=liquidsoap:liquidsoap . /music
RUN echo '<h1>📻 Radio Activa 24/7 en linea en Railway!</h1>' > /music/index.html

# Configuramos el supervisor
RUN echo '[supervisord]\nnodaemon=true\n\n[program:web]\ncommand=python3 /web.py\nuser=root\nautostart=true\nautorestart=true\n\n[program:radio]\ncommand=liquidsoap /music/radio.liq\nuser=liquidsoap\nautostart=true\nautorestart=true' > /etc/supervisor/conf.d/supervisord.conf

# Arrancamos con supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
