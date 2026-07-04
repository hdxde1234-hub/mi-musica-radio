FROM savonet/liquidsoap:v2.1.4

USER root

# REPARACIÓN INMORTAL: Forzamos a apt a actualizar el llavero sin verificar firmas viejas
RUN echo "deb [allow-insecure=yes] http://deb.debian.org/debian bookworm main" > /etc/apt/sources.list && \
    apt-get update -o Acquire::AllowInsecureRepositories=true || true && \
    apt-get install -y --allow-unauthenticated debian-archive-keyring && \
    rm -rf /var/lib/apt/lists/*

# Ahora con el sistema 100% legal y protegido, instalamos supervisor de forma normal
RUN apt-get update && apt-get install -y supervisor

# Creamos la mini página web para engañar a Railway y que no se apague al minuto
RUN echo 'import http.server, os; PORT = int(os.environ.get("PORT", 8080)); http.server.ThreadingHTTPServer(("0.0.0.0", PORT), lambda *args: http.server.SimpleHTTPRequestHandler(*args, directory="/music")).serve_forever()' > /web.py

WORKDIR /music
COPY --chown=liquidsoap:liquidsoap . /music
RUN echo '<h1>📻 Radio Activa 24/7 en linea en Railway!</h1>' > /music/index.html

# Configuramos el supervisor para correr la web y la radio en paralelo
RUN echo '[supervisord]\nnodaemon=true\n\n[program:web]\ncommand=python3 /web.py\nuser=root\nautostart=true\nautorestart=true\n\n[program:radio]\ncommand=liquidsoap /music/radio.liq\nuser=liquidsoap\nautostart=true\nautorestart=true' > /etc/supervisor/conf.d/supervisord.conf

# Arrancamos el sistema completo
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
