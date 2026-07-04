# 1. CAPTURAR EL PUERTO QUE RENDER EXIGE
puerto_web = int_of_string(getenv("PORT"))

# Configuramos el servidor interno con la sintaxis correcta
set("harbor.bind_addr", "0.0.0.0")
set("harbor.http.port", puerto_web)

# 2. CREAR LA PÁGINA WEB PARA ENGAÑAR A RENDER
def respuesta_ping(~protocol, ~data, ~headers, uri) =
  http.response(
    code=200,
    headers=[("Content-Type", "text/html; charset=utf-8")],
    data="<h1>📻 Radio Activa 24/7 en linea y escuchando pings!</h1>"
  )
end

# Registramos la página web en la raíz "/"
harbor.http.register.simple(port=puerto_web, method="GET", "/", respuesta_ping)


# 3. TU MÚSICA Y CONEXIÓN DE SIEMPRE
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
