# Tu carpeta con tus MP3 listos
musica = playlist.safe("/music")

# La forma real y correcta para esta versión de leer variables
host = environment.string("STREAM_HOST")
port = int_of_string(environment.string("STREAM_PORT"))
password = environment.string("STREAM_PASSWORD")
punto_montaje = environment.string("STREAM_MOUNT")

# Conexión directa a Icecast
output.icecast(%mp3, 
  host=host, 
  port=port, 
  password=password, 
  mount=punto_montaje, 
  musica
)
