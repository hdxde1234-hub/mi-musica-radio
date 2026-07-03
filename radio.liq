# Configuramos la carpeta de música que subiste
musica = playlist.safe("/music")

# Agarramos tus variables de entorno de Render de forma correcta
host = environment.get("STREAM_HOST")
port = int_of_string(environment.get("STREAM_PORT"))
password = environment.get("STREAM_PASSWORD")

# Empujamos la música directo a tu Listen2MyRadio
output.icecast(%mp3, 
  host=host, 
  port=port, 
  password=password, 
  mount="/stream", 
  musica
)
