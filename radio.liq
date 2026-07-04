# Tu música guardada en la carpeta
musica = playlist.safe("/music")

# Tus datos secretos de Listen2myradio
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
