# El código estético: apunta directo a la carpeta de música
musica = playlist.safe(mode="normal", reload_mode="watch", "/home/runner/work/mi-musica-radio/mi-musica-radio/music")

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
