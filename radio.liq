# Configuramos la carpeta de música que subiste
musica = playlist.safe("/music")

# Agarramos tus variables de entorno de Render correctamente
host = environment.get_default("STREAM_HOST", "")
port = int_of_string(environment.get_default("STREAM_PORT", "8000"))
password = environment.get_default("STREAM_PASSWORD", "")

# Empujamos la música directo a tu Listen2MyRadio
output.icecast(%mp3, 
  host=host, 
  port=port, 
  password=password, 
  mount="/stream", 
  musica
)
