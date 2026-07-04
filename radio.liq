# Le ordenamos a Liquidsoap que encienda la web de Python en segundo plano
system("python3 /web.py &")

# Tu configuración de música de siempre (El tubo)
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
