# Tu carpeta con tus MP3 listos
musica = playlist.safe("/music")

# La forma exacta en que esta versión lee las variables de Render
host = environment["STREAM_HOST"]
port = int_of_string(environment["STREAM_PORT"])
password = environment["STREAM_PASSWORD"]
punto_montaje = environment["STREAM_MOUNT"]

# Conexión directa a Icecast
output.icecast(%mp3, 
  host=host, 
  port=port, 
  password=password, 
  mount=punto_montaje, 
  musica
)
