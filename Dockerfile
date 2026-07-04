FROM savonet/liquidsoap:v2.1.4

# Cambiamos a root temporalmente para instalar Node.js
USER root
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Configuramos el directorio de trabajo
WORKDIR /music
COPY --chown=liquidsoap:liquidsoap . /music

# Instalamos Express para la web
RUN npm install express

# Volvemos al usuario de liquidsoap por seguridad
USER liquidsoap

# Ahora ejecutamos el archivo index.js con Node
CMD ["node", "index.js"]
