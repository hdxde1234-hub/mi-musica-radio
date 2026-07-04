# 1. Traemos Node.js oficial listo para usar
FROM node:22-slim AS node

# 2. Tu imagen de siempre de Liquidsoap
FROM savonet/liquidsoap:v2.1.4

# 3. Le copiamos Node.js directamente (sin instalar nada raro)
USER root
COPY --from=node /usr/local /usr/local

# 4. Configuramos tu carpeta de música
WORKDIR /music
COPY --chown=liquidsoap:liquidsoap . /music

# Instalamos express
RUN npm install express

# Volvemos al usuario de la radio por seguridad
USER liquidsoap

# Ejecutamos el archivo de Node
CMD ["node", "index.js"]
