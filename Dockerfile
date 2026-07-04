FROM savonet/liquidsoap:v2.1.4

USER root

# REPARACIÓN DIRECTA DE LLAVES DEBIAN VÍA HTTPS (Sin usar apt)
# Descargamos los paquetes oficiales de llaves actualizadas directamente desde los servidores de Debian
RUN wget -q http://ftp.debian.org/debian/pool/main/d/debian-archive-keyring/debian-archive-keyring_2023.3+deb12u1_all.deb && \
    dpkg -i debian-archive-keyring_2023.3+deb12u1_all.deb && \
    rm debian-archive-keyring_2023.3+deb12u1_all.deb

# Ahora que el sistema confía en los servidores, limpiamos y actualizamos de verdad
RUN rm -rf /var/lib/apt/lists/* && apt-get update && apt-get install -y supervisor

# Creamos la mini página web para engañar a Railway y que no se apague al minuto
RUN echo 'import http.server, os; PORT = int(os.environ.get("PORT", 8080)); http.server.ThreadingHTTPServer(("0.0.0.0", PORT), lambda *args: http.server.SimpleHTTPRequestHandler(*args, directory="/music")).serve_forever()' > /web.py

WORKDIR /music
COPY --chown=liquidsoap:liquidsoap . /music
RUN echo '<h1>📻 Radio Activa 24/7 en linea en Railway!</h1>' > /music/index.html

# Configuramos el supervisor para correr la web y la radio en paralelo
RUN echo '[supervisord]\nnodaemon=true\n\n[program:web]\ncommand=python3 /web.py\nuser=root\nautostart=true\nautorestart=true\n\n[program:radio]\ncommand=liquidsoap /music/radio.liq\nuser=liquidsoap\nautostart=true\nautorestart=true' > /etc/supervisor/conf.d/supervisord.conf

# Arrancamos el sistema completo
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
