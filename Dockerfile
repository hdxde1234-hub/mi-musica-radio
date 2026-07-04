FROM savonet/liquidsoap:v2.1.4
USER root
RUN echo 'import http.server, os; PORT = int(os.environ.get("PORT", 10000)); http.server.ThreadingHTTPServer(("0.0.0.0", PORT), lambda *args: http.server.SimpleHTTPRequestHandler(*args, directory="/music")).serve_forever()' > /web.py
WORKDIR /music
COPY --chown=liquidsoap:liquidsoap . /music
RUN echo '<h1>📻 Radio Activa 24/7 en linea!</h1>' > /music/index.html
USER liquidsoap
CMD ["liquidsoap", "/music/radio.liq"]
