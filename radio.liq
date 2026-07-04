# 1. Activamos el servidor web interno de Liquidsoap en el puerto de Render
set("harbor.bind_addr", "0.0.0.0")
settings.harbor.http.port.set(10000)

# 2. Creamos la página web para responderle a UptimeRobot y Cron-job
def respuesta_ping(~protocol, ~data, ~headers, uri) =
  http.response(
    status_code=200,
    headers=[("Content-Type", "text/html; charset=utf-8")],
    data="<h1>📻 Radio Activa 24/7 en linea y escuchando pings!</h1>"
  )
end

# Registramos la página en la raíz (/)
harbor.http.register.simple(port=10000, method="GET", "/", respuesta_ping)

# 3. Tu configuración de música de siempre (Sin tocar el tubo)
musica = playlist.safe("/music")

host = getenv("STREAM_HOST")
port = int_of_string(getenv("STREAM_PORT"))
password = getenv("STREAM_PASSWORD")
punto_montaje = getenv("STREAM_MOUNT")

output.icecast(%mp3, 
  host=host, 
  port=port, 
  password=password, 
  mount=punto_montaje, 
  musica
)
