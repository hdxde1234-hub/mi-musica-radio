# Tu carpeta con tus MP3 listos
musica = playlist.safe("/music")

# El comando clásico que nunca falla para leer variables en la nube
host = getenv("STREAM_HOST")
port = int_of_string(getenv("STREAM_PORT"))
password = getenv("STREAM_PASSWORD")
punto_montaje = getenv("STREAM_MOUNT")

# Conexión directa a Icecast
output.icecast(%mp3, 
  host=host, 
  port=port, 
  password=password, 
  mount=punto_montaje, 
  musica
)
